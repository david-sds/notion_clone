import 'package:drift/drift.dart';

class SyncStatesTable extends Table {
  TextColumn get entity => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {entity};
}
