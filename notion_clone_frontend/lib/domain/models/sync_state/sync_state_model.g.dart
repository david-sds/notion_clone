// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncStateImpl _$$SyncStateImplFromJson(Map<String, dynamic> json) =>
    _$SyncStateImpl(
      entity: $enumDecode(_$EntityTypeEnumMap, json['entity']),
      lastSyncedAt: DateTime.parse(json['lastSyncedAt'] as String),
    );

Map<String, dynamic> _$$SyncStateImplToJson(_$SyncStateImpl instance) =>
    <String, dynamic>{
      'entity': _$EntityTypeEnumMap[instance.entity]!,
      'lastSyncedAt': instance.lastSyncedAt.toIso8601String(),
    };

const _$EntityTypeEnumMap = {
  EntityType.document: 'document',
};
