import 'package:mini_task_manager/data/repository/task_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

 part 'task_order_provider.g.dart';

@riverpod
class TaskOrderByController extends _$TaskOrderByController {
  @override
  OrderBy build() => OrderBy.priority;

  void setOrder(OrderBy order) => state = order;
}