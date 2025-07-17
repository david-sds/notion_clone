import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

enum OperationEntity { document }

enum OperationType { create, update, delete }

@freezed
abstract class Operation with _$Operation {
  const factory Operation({
    String? id,
    required OperationEntity entity,
    required OperationType type,
    required String payload,
    DateTime? timestamp,
    required String userId,
  }) = _DocumentModel;

  factory Operation.fromJson(Map<String, Object?> json) =>
      _$OperationFromJson(json);
}
