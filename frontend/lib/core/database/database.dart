import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:frontend/core/database/tables/documents_table.dart';
import 'package:frontend/core/database/tables/operations_table.dart';
import 'package:frontend/models/document_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Documents,
    Operations,
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
