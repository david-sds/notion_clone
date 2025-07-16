import 'package:flutter/foundation.dart';
import 'package:notion_clone_frontend/data/services/local/documents/documents_dao.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';

class DocumentsViewmodel extends ChangeNotifier {
  DocumentsViewmodel({
    required DocumentsDao documentsDao,
  }) : _documentsDao = documentsDao;

  late final DocumentsDao _documentsDao;

  List<Document> _documents = [];
  List<Document> get documents => _documents;
  void setDocuments(List<Document> values) => _documents = values;

  Future<void> create(Document payload) async {
    try {
      await _documentsDao.insertDocument(payload);

      await load();
    } catch (e) {
      debugPrint('Error while creating document => $e');
    }
  }

  Future<void> update(String id, Document payload) async {
    try {
      await _documentsDao.updateDocument(id, payload);

      await load();
    } catch (e) {
      debugPrint('Error while deleting document => $e');
    }
  }

  Future<void> delete(String id) async {
    try {
      await _documentsDao.deleteDocument(id);

      await load();
    } catch (e) {
      debugPrint('Error while deleting document => $e');
    }
  }

  Future<void> load() async {
    try {
      final allItems = await _documentsDao.selectDocuments();
      _documents = allItems;
      notifyListeners();
    } catch (e) {
      debugPrint('Error while loading documents => $e');
    }
  }
}
