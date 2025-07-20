import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:notion_clone_frontend/core/database/database.dart';
import 'package:notion_clone_frontend/core/database/tables.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';
import 'package:uuid/uuid.dart';

part 'operations_dao.g.dart';

@DriftAccessor(tables: [OperationsTable])
class OperationsDao extends DatabaseAccessor<AppDatabase>
    with _$OperationsDaoMixin {
  OperationsDao(super.db);

  Future<List<Operation>> findAllOperations() async {
    final allItems = await (db.select(db.operationsTable)).get();

    return allItems.map(_entityToModel).toList();
  }

  Future<List<Operation>> findOperationsSince(
    EntityType entityType,
    DateTime? lastSync, {
    orderByTimestamp = OrderingMode.asc,
  }) async {
    final operationsSinceSync = await (db.select(db.operationsTable)
          ..where((tbl) {
            final conditions = [tbl.entity.equals(entityType.name)];

            if (lastSync != null) {
              conditions.add(tbl.timestamp.isBiggerThanValue(lastSync));
            }

            return conditions.reduce((a, b) => a & b);
          })
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.timestamp,
                  mode: orderByTimestamp,
                ),
          ]))
        .get();

    return operationsSinceSync.map(_entityToModel).toList();
  }

  Future<int> insertOperation(Operation operation) async {
    return await db.into(db.operationsTable).insert(
          OperationsTableCompanion.insert(
            id: Value(const Uuid().v4()),
            entity: operation.entity.name,
            timestamp: Value(DateTime.now()),
            payload: jsonEncode(operation.payload),
            type: operation.type.name,
            userId: operation.userId,
          ),
          mode: InsertMode.insert,
        );
  }

  Operation _entityToModel(OperationsTableData entity) {
    return Operation(
      id: entity.id,
      payload: jsonDecode(entity.payload),
      entity: EntityType.values.firstWhere(
        (entityType) => entityType.name == entity.entity,
      ),
      type: OperationType.values.firstWhere(
        (operationType) => operationType.name == entity.type,
      ),
      timestamp: entity.timestamp.toUtc(),
      userId: entity.userId,
    );
  }
}
