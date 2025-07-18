import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:notion_clone_frontend/data/services/local/operations/operations_dao.dart';
import 'package:notion_clone_frontend/data/services/local/sync_states/sync_states_dao.dart';
import 'package:notion_clone_frontend/data/services/remote/operations/operations_api.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';
import 'package:notion_clone_frontend/domain/models/sync_state/sync_state_model.dart';

class SyncService extends ChangeNotifier {
  SyncService({
    required OperationsDao operationsDao,
    required SyncStatesDao syncStatesDao,
    required OperationsApi operationsApi,
  })  : _operationsDao = operationsDao,
        _syncStatesDao = syncStatesDao,
        _operationsApi = operationsApi;

  final OperationsDao _operationsDao;
  final SyncStatesDao _syncStatesDao;
  final OperationsApi _operationsApi;

  Timer? _debounceTimer;
  Timer? _retryTimer;

  bool _isOnline = true;

  Future<void> scheduleSync() async {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(seconds: 3), () => _trySync());
  }

  Future<void> _trySync() async {
    if (!_isOnline) {
      _startRetryTimer();
      return;
    }

    _retryTimer?.cancel();

    try {
      await syncAll();

      _retryTimer?.cancel();
    } catch (e) {
      debugPrint('Error while trying to sync => $e');
      _startRetryTimer();
    }
  }

  void _startRetryTimer() {
    if (_retryTimer != null && _retryTimer!.isActive) return;

    _retryTimer = Timer.periodic(
      const Duration(minutes: 2),
      (timer) async {
        if (_isOnline) {
          try {
            await syncAll();
            timer.cancel();
          } catch (_) {}
        }
      },
    );
  }

  void updateConnectivity(bool isOnline) {
    _isOnline = isOnline;

    if (isOnline) {
      _trySync();
    }
  }

  Future<void> syncAll() async {
    await Future.wait(
      EntityType.values.map((entity) => syncEntity(entity)),
    );
  }

  Future<void> syncEntity(EntityType entityType) async {
    final lastSync = await _syncStatesDao.findLastSync(entityType);
    final unsyncedOperations = await _operationsDao.findOperationsSince(
      entityType,
      lastSync,
    );

    if (unsyncedOperations.isEmpty) {
      return;
    }

    final success = await _operationsApi.pushOperations(unsyncedOperations);
    if (!success) {
      return;
    }

    final lastSyncTimestamp = unsyncedOperations.last.timestamp;
    await _syncStatesDao.upsertSyncState(
      SyncState(
        entity: entityType,
        lastSyncedAt: lastSyncTimestamp,
      ),
    );
  }
}
