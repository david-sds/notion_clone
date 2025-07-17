import 'dart:async';

import 'package:notion_clone_frontend/core/exceptions/invalid_uuid_exception.dart';
import 'package:notion_clone_frontend/data/repository/documents/documents_repository.dart';
import 'package:notion_clone_frontend/data/services/local/database.dart';
import 'package:notion_clone_frontend/data/services/local/documents/dao/documents_dao.dart';
import 'package:notion_clone_frontend/data/services/local/operations/dao/operations_dao.dart';
import 'package:notion_clone_frontend/data/services/sync_service/sync_service.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';
import 'package:notion_clone_frontend/domain/models/operation/operation_model.dart';

class DocumentRepositoryImpl extends DocumentsRepository {
  late final AppDatabase _db;
  late final DocumentsDao _documentsDao;
  late final OperationsDao _operationsDao;
  late final SyncService _syncService;

  DocumentRepositoryImpl({
    required AppDatabase db,
    required DocumentsDao documentsDao,
    required OperationsDao operationsDao,
    required SyncService syncService,
  })  : _db = db,
        _documentsDao = documentsDao,
        _operationsDao = operationsDao,
        _syncService = syncService;

  @override
  Future<List<Document>> getDocuments() async {
    return await _documentsDao.findAllDocuments();
  }

  @override
  Future<void> createDocument(Document document) async {
    final operation = Operation(
      entity: EntityType.document,
      type: OperationType.create,
      payload: document.toJson().toString(),
      userId: 'userId',
      timestamp: DateTime.now(),
    );

    await _db.transaction<void>(() async {
      await _documentsDao.insertDocument(document);
      await _operationsDao.insertOperation(operation);
    });

    await _syncService.scheduleSync();
  }

  @override
  Future<void> updateDocument(Document document) async {
    final op = Operation(
      entity: EntityType.document,
      type: OperationType.update,
      payload: document.toJson().toString(),
      userId: 'userId',
      timestamp: DateTime.now(),
    );

    final documentId = document.id;

    if (documentId == null) {
      throw InvalidUuidException();
    }

    await _db.transaction(() async {
      await _documentsDao.updateDocument(documentId, document);
      await _operationsDao.insertOperation(op);
    });

    await _syncService.scheduleSync();
  }

  @override
  Future<void> deleteDocument(Document document) async {
    final op = Operation(
      entity: EntityType.document,
      type: OperationType.delete,
      payload: document.toJson().toString(),
      timestamp: DateTime.now(),
      userId: 'userId',
    );

    final documentId = document.id;

    if (documentId == null) {
      throw InvalidUuidException();
    }

    await _db.transaction(() async {
      await _documentsDao.deleteDocument(documentId);
      await _operationsDao.insertOperation(op);
    });

    await _syncService.scheduleSync();
  }
}
