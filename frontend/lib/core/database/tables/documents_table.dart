import 'package:drift/drift.dart';
import 'package:frontend/models/document_model.dart';
import 'package:uuid/uuid.dart';

@UseRowClass(Document)
class Documents extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get title => text().withLength(max: 512)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
