import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

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
