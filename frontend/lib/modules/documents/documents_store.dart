import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/core/database/database.dart';
import 'package:frontend/models/document_model.dart';
import 'package:mobx/mobx.dart';

part 'documents_store.g.dart';

final database = AppDatabase();

class DocumentsStore extends _DocumentsStoreBase with _$DocumentsStore {}

abstract class _DocumentsStoreBase with Store {
  @observable
  List<Document> _documents = [];
  @computed
  List<Document> get documents => _documents;
  @action
  void setDocuments(List<Document> values) => _documents = values;

  @action
  Future<void> create(Document payload) async {
    try {
      await database.into(database.documents).insert(
            DocumentsCompanion.insert(
              title: payload.title,
            ),
            mode: InsertMode.insert,
          );

      await load();
    } catch (e) {
      debugPrint('Error while creating document => $e');
    }
  }

  @action
  Future<void> update(String id, Document payload) async {
    try {
      await (database.update(database.documents)
            ..where((tbl) => tbl.id.equals(id)))
          .write(
        DocumentsCompanion(
          title: Value(payload.title),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await load();
    } catch (e) {
      debugPrint('Error while deleting document => $e');
    }
  }

  @action
  Future<void> delete(String id) async {
    try {
      await (database.delete(database.documents)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      await load();
    } catch (e) {
      debugPrint('Error while deleting document => $e');
    }
  }

  @action
  Future<void> load() async {
    try {
      final allItems = await database.select(database.documents).get();
      _documents = allItems;
    } catch (e) {
      debugPrint('Error while loading documents => $e');
    }
  }
}
