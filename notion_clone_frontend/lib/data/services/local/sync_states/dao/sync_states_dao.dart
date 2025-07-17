import 'package:drift/drift.dart';
import 'package:notion_clone_frontend/data/services/local/database.dart';
import 'package:notion_clone_frontend/data/services/local/sync_states/table/sync_state_table.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';
import 'package:notion_clone_frontend/domain/models/sync_state/sync_state_model.dart';

part 'sync_states_dao.g.dart';

@DriftAccessor(tables: [SyncStatesTable])
class SyncStatesDao extends DatabaseAccessor<AppDatabase>
    with _$SyncStatesDaoMixin {
  SyncStatesDao(super.db);

  Future<List<SyncState>> findAllSyncStates() async {
    final allItems = await (db.select(db.syncStatesTable)).get();

    return allItems
        .map((entity) => SyncState(
              entity: EntityType.values.firstWhere(
                (entityType) => entityType.name == entity.entity,
              ),
              lastSyncedAt: entity.lastSyncedAt,
            ))
        .toList();
  }

  Future<DateTime?> findLastSync(EntityType entityType) async {
    final entities = await (db.select(db.syncStatesTable)
          ..where((tbl) => tbl.entity.equals(entityType.name)))
        .get();

    if (entities.isEmpty) {
      return null;
    }

    return entities[0].lastSyncedAt;
  }

  Future<int> upsertSyncState(SyncState syncState) async {
    return await db.into(db.syncStatesTable).insertOnConflictUpdate(
          SyncStatesTableCompanion.insert(
            entity: syncState.entity.name,
            lastSyncedAt: syncState.lastSyncedAt,
          ),
        );
  }
}
