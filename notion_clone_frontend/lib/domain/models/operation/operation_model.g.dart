// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
      id: json['id'] as String?,
      entity: $enumDecode(_$EntityTypeEnumMap, json['entity']),
      type: $enumDecode(_$OperationTypeEnumMap, json['type']),
      payload: json['payload'] as Map<String, dynamic>,
      timestamp: DateTime.parse(json['timestamp'] as String),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity': _$EntityTypeEnumMap[instance.entity]!,
      'type': _$OperationTypeEnumMap[instance.type]!,
      'payload': instance.payload,
      'timestamp': instance.timestamp.toIso8601String(),
      'userId': instance.userId,
    };

const _$EntityTypeEnumMap = {
  EntityType.document: 'document',
};

const _$OperationTypeEnumMap = {
  OperationType.create: 'create',
  OperationType.update: 'update',
  OperationType.delete: 'delete',
};
