import 'package:notion_clone_frontend/data/services/local/operations/dao/operations_dao.dart';
import 'package:notion_clone_frontend/data/services/local/sync_states/dao/sync_states_dao.dart';
import 'package:notion_clone_frontend/data/services/remote/operations/operations_api.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';
import 'package:notion_clone_frontend/domain/models/sync_state/sync_state_model.dart';

class SyncService {
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

  Future<void> syncAll() async {
    await Future.wait(
      EntityType.values.map((entity) => syncEntity(entity)),
    );
  }
}
