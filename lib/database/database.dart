import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:mini_task_manager/database/tables/task_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TaskTable])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  AppDb.test() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
