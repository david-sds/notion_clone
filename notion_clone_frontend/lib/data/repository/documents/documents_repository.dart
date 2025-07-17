import 'package:notion_clone_frontend/domain/models/document/document_model.dart';

abstract class DocumentsRepository {
  Future<List<Document>> getDocuments();

  Future<void> createDocument(Document document);

  Future<void> updateDocument(Document document);

  Future<void> deleteDocument(Document document);
}
