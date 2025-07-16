import 'package:drift/drift.dart';

class OperationsTable extends Table {
  TextColumn get id => text()();
  TextColumn get entity => text()();
  TextColumn get type => text()();
  TextColumn get payload => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get userId => text()();

  @override
  Set<Column> get primaryKey => {id};
}
