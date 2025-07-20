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

    return allItems.map(_entityToModel).toList();
  }

  Future<Document> insertDocument(Document document) async {
    final entity = await db.into(db.documentsTable).insertReturning(
          DocumentsTableCompanion.insert(
            id: Value(const Uuid().v4()),
            title: Value(document.title),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
          mode: InsertMode.insert,
        );

    return _entityToModel(entity);
  }

  Future<Document> updateDocument(String id, Document document) async {
    final entities = await (db.update(db.documentsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .writeReturning(
      DocumentsTableCompanion(
        title: Value(document.title ?? ''),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return _entityToModel(entities.first);
  }

  Future<Document> deleteDocument(String id) async {
    final entities = await (db.update(db.documentsTable)
          ..where((tbl) => tbl.id.equals(id)))
        .writeReturning(
      DocumentsTableCompanion(
        deletedAt: Value(DateTime.now()),
      ),
    );

    return _entityToModel(entities.first);
  }

  Document _entityToModel(DocumentsTableData entity) {
    return Document(
      id: entity.id,
      title: entity.title,
      createdAt: entity.createdAt.toUtc(),
      updatedAt: entity.updatedAt.toUtc(),
      deletedAt: entity.deletedAt?.toUtc(),
    );
  }
}
