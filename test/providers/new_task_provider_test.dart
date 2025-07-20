import 'package:flutter_test/flutter_test.dart';
import 'package:jamtm/screens/home/providers/new_task_provider.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  test('NewTaskProvider updates state correctly', () {
    final container = ProviderContainer();
    final notifier = container.read(newTaskProvider().notifier);

    notifier.updateTitle('New Title');
    expect(container.read(newTaskProvider()).title, 'New Title');

    notifier.updateDescription('Description');
    expect(container.read(newTaskProvider()).description, 'Description');

    final now = DateTime.now();
    notifier.updateDate(now);
    expect(container.read(newTaskProvider()).date, now);

    notifier.updatePriority(2);
    expect(container.read(newTaskProvider()).priority, 2);
  });
}
