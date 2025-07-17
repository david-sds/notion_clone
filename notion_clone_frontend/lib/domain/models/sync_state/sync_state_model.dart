import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';

part 'sync_state_model.freezed.dart';
part 'sync_state_model.g.dart';

@freezed
abstract class SyncState with _$SyncState {
  const factory SyncState({
    required EntityType entity,
    required DateTime lastSyncedAt,
  }) = _SyncState;

  factory SyncState.fromJson(Map<String, Object?> json) =>
      _$SyncStateFromJson(json);
}
