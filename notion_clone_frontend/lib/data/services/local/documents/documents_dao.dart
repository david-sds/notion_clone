import 'package:drift/drift.dart';
import 'package:notion_clone_frontend/core/database/database.dart';
import 'package:notion_clone_frontend/core/database/tables.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';
import 'package:uuid/uuid.dart';

part 'documents_dao.g.dart';

@DriftAccessor(tables: [DocumentsTable])
class DocumentsDao extends DatabaseAccessor<AppDatabase>
    with _$DocumentsDaoMixin {
  DocumentsDao(super.db);

  Future<List<Document>> findAllDocuments() async {
    final allItems = await (db.select(db.documentsTable)
          ..where((tbl) => tbl.deletedAt.isNull()))
        .get();

    return allItems
        .map((entity) => Document(
              id: entity.id,
              title: entity.title,
              createdAt: entity.createdAt,
              updatedAt: entity.updatedAt,
              deletedAt: entity.deletedAt,
            ))
        .toList();
  }

  Future<int> insertDocument(Document document) async {
    return await db.into(db.documentsTable).insert(
          DocumentsTableCompanion.insert(
            id: Value(const Uuid().v4()),
            title: Value(document.title),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
          mode: InsertMode.insert,
        );
  }

  Future<int> updateDocument(String id, Document document) async {
    return await (db.update(db.documentsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      DocumentsTableCompanion(
        title: Value(document.title ?? ''),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deleteDocument(String id) async {
    return await (db.update(db.documentsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      DocumentsTableCompanion(
        deletedAt: Value(DateTime.now()),
      ),
    );
  }
}
