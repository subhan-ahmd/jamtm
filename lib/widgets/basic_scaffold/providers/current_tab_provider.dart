import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_tab_provider.g.dart';

@riverpod
class CurrentTab extends _$CurrentTab {
  @override
  int build() => 0;

  void toggle(int index) => state = index;
}
