import 'package:frontend/api/crud.dart';
import 'package:frontend/models/document_model.dart';

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
