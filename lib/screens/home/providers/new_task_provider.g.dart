// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newTaskHash() => r'de4409ce0cbdd4b5ffc109ea7262f989e2f8cbd1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NewTask extends BuildlessAutoDisposeNotifier<Task> {
  late final Task? initial;

  Task build({Task? initial});
}

/// See also [NewTask].
@ProviderFor(NewTask)
const newTaskProvider = NewTaskFamily();

/// See also [NewTask].
class NewTaskFamily extends Family<Task> {
  /// See also [NewTask].
  const NewTaskFamily();

  /// See also [NewTask].
  NewTaskProvider call({Task? initial}) {
    return NewTaskProvider(initial: initial);
  }

  @override
  NewTaskProvider getProviderOverride(covariant NewTaskProvider provider) {
    return call(initial: provider.initial);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newTaskProvider';
}

/// See also [NewTask].
class NewTaskProvider extends AutoDisposeNotifierProviderImpl<NewTask, Task> {
  /// See also [NewTask].
  NewTaskProvider({Task? initial})
    : this._internal(
        () => NewTask()..initial = initial,
        from: newTaskProvider,
        name: r'newTaskProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$newTaskHash,
        dependencies: NewTaskFamily._dependencies,
        allTransitiveDependencies: NewTaskFamily._allTransitiveDependencies,
        initial: initial,
      );

  NewTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initial,
  }) : super.internal();

  final Task? initial;

  @override
  Task runNotifierBuild(covariant NewTask notifier) {
    return notifier.build(initial: initial);
  }

  @override
  Override overrideWith(NewTask Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewTaskProvider._internal(
        () => create()..initial = initial,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initial: initial,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NewTask, Task> createElement() {
    return _NewTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewTaskProvider && other.initial == initial;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initial.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NewTaskRef on AutoDisposeNotifierProviderRef<Task> {
  /// The parameter `initial` of this provider.
  Task? get initial;
}

class _NewTaskProviderElement
    extends AutoDisposeNotifierProviderElement<NewTask, Task>
    with NewTaskRef {
  _NewTaskProviderElement(super.provider);

  @override
  Task? get initial => (origin as NewTaskProvider).initial;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
