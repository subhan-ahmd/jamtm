import 'package:flutter_test/flutter_test.dart';
import 'package:jamtm/screens/home/providers/selected_tasks_provider.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  test('SelectedTasksProvider basic operations', () {
    final container = ProviderContainer();
    final notifier = container.read(selectedTasksProvider.notifier);

    notifier.add(1);
    notifier.add(2);
    expect(container.read(selectedTasksProvider), [1, 2]);

    notifier.remove(1);
    expect(container.read(selectedTasksProvider), [2]);

    notifier.addAll([3, 4]);
    expect(container.read(selectedTasksProvider), [3, 4]);

    notifier.removeAll();
    expect(container.read(selectedTasksProvider), []);
  });
}
