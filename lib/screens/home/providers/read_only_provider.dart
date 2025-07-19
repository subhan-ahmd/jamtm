import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_only_provider.g.dart';

@riverpod
class ReadOnly extends _$ReadOnly {
  @override
  bool build(int? id) => true;

  void toggle() => state = !state;
}