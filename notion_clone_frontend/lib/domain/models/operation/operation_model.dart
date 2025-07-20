import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

enum EntityType { document }

enum OperationType { create, update, delete }

@freezed
abstract class Operation with _$Operation {
  const factory Operation({
    String? id,
    required EntityType entity,
    required OperationType type,
    required Map<String, dynamic> payload,
    required DateTime timestamp,
    required String userId,
  }) = _DocumentModel;

  factory Operation.fromJson(Map<String, Object?> json) =>
      _$OperationFromJson(json);
}
