import 'package:drift/drift.dart';
import 'package:mini_task_manager/database/database.dart';
import 'package:mini_task_manager/domain/repository/base_repository.dart';

enum OrderBy { priority, date }

class TaskRepositoryImpl
    implements BaseRepository<TaskTableCompanion, TaskTableData, OrderBy> {
  final AppDb db;
  TaskRepositoryImpl(this.db);

  @override
  Future<int> insert(TaskTableCompanion entity) {
    return db.into(db.taskTable).insert(entity);
  }

  @override
  Future<List<TaskTableData>> getAll() {
    return db.select(db.taskTable).get();
  }

  @override
  Future<TaskTableData?> getById(int id) {
    return (db.select(
      db.taskTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<int> update(int id, TaskTableCompanion entity) {
    return (db.update(
      db.taskTable,
    )..where((t) => t.id.equals(id))).write(entity);
  }

  @override
  Future<int> delete(int id) {
    return (db.delete(db.taskTable)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<int> deleteAll() {
    return db.delete(db.taskTable).go();
  }

  @override
  Future<List<TaskTableData>> getAllOrdered({
    required OrderBy orderBy,
    bool descending = false,
  }) {
    final order = descending ? OrderingMode.desc : OrderingMode.asc;

    return (db.select(db.taskTable)..orderBy([
          (t) =>
              OrderingTerm(expression: t.isCompleted, mode: OrderingMode.asc),
          (t) {
            final primaryColumn = switch (orderBy) {
              OrderBy.priority => t.priority,
              OrderBy.date => t.date,
            };
            return OrderingTerm(expression: primaryColumn, mode: order);
          },
          (t) {
            final fallbackColumn = switch (orderBy) {
              OrderBy.priority => t.date,
              OrderBy.date => t.priority,
            };
            return OrderingTerm(
              expression: fallbackColumn,
              mode: OrderingMode.asc,
            );
          },
          (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
          (t) => OrderingTerm(expression: t.title, mode: OrderingMode.asc),
          (t) =>
              OrderingTerm(expression: t.description, mode: OrderingMode.asc),
        ]))
        .get();
  }
}
