import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class SyncStatesTable extends Table {
  TextColumn get entity => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {entity};
}

class OperationsTable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get entity => text()();
  TextColumn get type => text()();
  TextColumn get payload => text()();
  DateTimeColumn get timestamp =>
      dateTime().clientDefault(() => DateTime.now())();
  TextColumn get userId => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class DocumentsTable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get title => text().withLength(max: 512).nullable()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
