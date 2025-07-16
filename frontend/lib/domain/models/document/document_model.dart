import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

@freezed
abstract class Document with _$Document {
  const Document._();
  const factory Document({
    String? id,
    required String title,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) = _DocumentModel;

  bool get isDeleted => deletedAt != null;

  factory Document.fromJson(Map<String, Object?> json) =>
      _$DocumentFromJson(json);
}
