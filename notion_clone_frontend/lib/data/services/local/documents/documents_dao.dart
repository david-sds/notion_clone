import 'package:drift/drift.dart';
import 'package:notion_clone_frontend/data/services/local/database.dart';
import 'package:notion_clone_frontend/data/services/local/documents/documents_table.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';

part 'documents_dao.g.dart';

@DriftAccessor(tables: [DocumentsTable])
class DocumentsDao extends DatabaseAccessor<AppDatabase>
    with _$DocumentsDaoMixin {
  DocumentsDao(super.db);

  Future<int> insertDocument(Document payload) async {
    return await db.into(db.documentsTable).insert(
          DocumentsTableCompanion.insert(
            title: payload.title,
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
          mode: InsertMode.insert,
        );
  }

  Future<int> updateDocument(String id, Document payload) async {
    return await (db.update(db.documentsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      DocumentsTableCompanion(
        title: Value(payload.title),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> deleteDocument(String id) async {
    return await (db.delete(db.documentsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<Document>> selectDocuments() async {
    final allItems = await db.select(db.documentsTable).get();

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
}
