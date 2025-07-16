// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _DocumentModel.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call(
      {String? id,
      String title,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentModelImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentModelImplCopyWith(
          _$DocumentModelImpl value, $Res Function(_$DocumentModelImpl) then) =
      __$$DocumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$DocumentModelImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentModelImpl>
    implements _$$DocumentModelImplCopyWith<$Res> {
  __$$DocumentModelImplCopyWithImpl(
      _$DocumentModelImpl _value, $Res Function(_$DocumentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$DocumentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentModelImpl extends _DocumentModel {
  const _$DocumentModelImpl(
      {this.id,
      required this.title,
      this.createdAt,
      this.updatedAt,
      this.deletedAt})
      : super._();

  factory _$DocumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Document(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, createdAt, updatedAt, deletedAt);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentModelImplCopyWith<_$DocumentModelImpl> get copyWith =>
      __$$DocumentModelImplCopyWithImpl<_$DocumentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentModelImplToJson(
      this,
    );
  }
}

abstract class _DocumentModel extends Document {
  const factory _DocumentModel(
      {final String? id,
      required final String title,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? deletedAt}) = _$DocumentModelImpl;
  const _DocumentModel._() : super._();

  factory _DocumentModel.fromJson(Map<String, dynamic> json) =
      _$DocumentModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentModelImplCopyWith<_$DocumentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
