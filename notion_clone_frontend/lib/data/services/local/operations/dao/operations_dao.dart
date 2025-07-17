import 'package:drift/drift.dart';
import 'package:notion_clone_frontend/data/services/local/database.dart';
import 'package:notion_clone_frontend/data/services/local/operations/table/operations_table.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';
import 'package:uuid/uuid.dart';

part 'operations_dao.g.dart';

@DriftAccessor(tables: [OperationsTable])
class OperationsDao extends DatabaseAccessor<AppDatabase>
    with _$OperationsDaoMixin {
  OperationsDao(super.db);

  Future<int> insertOperation(Operation payload) async {
    return await db.into(db.operationsTable).insert(
          OperationsTableCompanion.insert(
            id: Value(const Uuid().v4()),
            entity: payload.entity.name,
            timestamp: Value(DateTime.now()),
            payload: payload.payload,
            type: payload.type.name,
            userId: payload.userId,
          ),
          mode: InsertMode.insert,
        );
  }
}
