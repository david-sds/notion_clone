// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DocumentsStore on _DocumentsStoreBase, Store {
  Computed<List<Document>>? _$documentsComputed;

  @override
  List<Document> get documents =>
      (_$documentsComputed ??= Computed<List<Document>>(() => super.documents,
              name: '_DocumentsStoreBase.documents'))
          .value;

  late final _$_documentsAtom =
      Atom(name: '_DocumentsStoreBase._documents', context: context);

  @override
  List<Document> get _documents {
    _$_documentsAtom.reportRead();
    return super._documents;
  }

  @override
  set _documents(List<Document> value) {
    _$_documentsAtom.reportWrite(value, super._documents, () {
      super._documents = value;
    });
  }

  late final _$createAsyncAction =
      AsyncAction('_DocumentsStoreBase.create', context: context);

  @override
  Future<void> create(Document payload) {
    return _$createAsyncAction.run(() => super.create(payload));
  }

  late final _$updateAsyncAction =
      AsyncAction('_DocumentsStoreBase.update', context: context);

  @override
  Future<void> update(String id, Document payload) {
    return _$updateAsyncAction.run(() => super.update(id, payload));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_DocumentsStoreBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$loadAsyncAction =
      AsyncAction('_DocumentsStoreBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$_DocumentsStoreBaseActionController =
      ActionController(name: '_DocumentsStoreBase', context: context);

  @override
  void setDocuments(List<Document> values) {
    final _$actionInfo = _$_DocumentsStoreBaseActionController.startAction(
        name: '_DocumentsStoreBase.setDocuments');
    try {
      return super.setDocuments(values);
    } finally {
      _$_DocumentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
documents: ${documents}
    ''';
  }
}
