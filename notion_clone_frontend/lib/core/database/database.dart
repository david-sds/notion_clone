import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:notion_clone_frontend/core/database/tables.dart';
import 'package:notion_clone_frontend/data/services/local/documents/documents_dao.dart';
import 'package:notion_clone_frontend/data/services/local/operations/operations_dao.dart';
import 'package:notion_clone_frontend/data/services/local/sync_states/sync_states_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    DocumentsTable,
    OperationsTable,
    SyncStatesTable,
  ],
  daos: [
    DocumentsDao,
    OperationsDao,
    SyncStatesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'notion_clone_drift_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
      ),
    );
  }
}
