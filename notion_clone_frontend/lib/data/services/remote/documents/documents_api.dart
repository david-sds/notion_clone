import 'package:notion_clone_frontend/data/services/remote/crud.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';

class DocumentsApi extends CRUD<Document> {
  DocumentsApi()
      : super(
          path: '/documents',
          fromJson: (json) => Document(
            id: json['id'],
            title: json['title'],
          ),
        );
}
