import 'package:drift/drift.dart';

class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get priority => integer().nullable()();
  TextColumn get date => text().nullable()();
  BoolColumn get isCompleted => boolean().nullable()();
}
