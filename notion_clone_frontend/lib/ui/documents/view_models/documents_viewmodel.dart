import 'package:flutter/foundation.dart';
import 'package:notion_clone_frontend/data/repository/documents/documents_repository.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';

class DocumentsViewmodel extends ChangeNotifier {
  DocumentsViewmodel({
    required DocumentsRepository documentsRepository,
  }) : _documentsRepository = documentsRepository;

  late final DocumentsRepository _documentsRepository;

  List<Document> _documents = [];
  List<Document> get documents => _documents;
  void setDocuments(List<Document> values) => _documents = values;

  Future<void> create(Document payload) async {
    try {
      await _documentsRepository.createDocument(payload);

      await load();
    } catch (e) {
      debugPrint('Error while creating document => $e');
    }
  }

  Future<void> update(Document payload) async {
    try {
      await _documentsRepository.updateDocument(payload);

      await load();
    } catch (e) {
      debugPrint('Error while deleting document => $e');
    }
  }

  Future<void> delete(Document payload) async {
    try {
      await _documentsRepository.deleteDocument(payload);

      await load();
    } catch (e) {
      debugPrint('Error while deleting document => $e');
    }
  }

  Future<void> load() async {
    try {
      final allItems = await _documentsRepository.getDocuments();
      _documents = allItems;
      notifyListeners();
    } catch (e) {
      debugPrint('Error while loading documents => $e');
    }
  }
}
