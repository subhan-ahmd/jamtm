// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTasksHash() => r'0fb1a5168384b158b38768cc8ad3e7cf0e1ddc8c';

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

/// See also [filteredTasks].
@ProviderFor(filteredTasks)
const filteredTasksProvider = FilteredTasksFamily();

/// See also [filteredTasks].
class FilteredTasksFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [filteredTasks].
  const FilteredTasksFamily();

  /// See also [filteredTasks].
  FilteredTasksProvider call({bool upcoming = false}) {
    return FilteredTasksProvider(upcoming: upcoming);
  }

  @override
  FilteredTasksProvider getProviderOverride(
    covariant FilteredTasksProvider provider,
  ) {
    return call(upcoming: provider.upcoming);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredTasksProvider';
}

/// See also [filteredTasks].
class FilteredTasksProvider extends AutoDisposeFutureProvider<List<Task>> {
  /// See also [filteredTasks].
  FilteredTasksProvider({bool upcoming = false})
    : this._internal(
        (ref) => filteredTasks(ref as FilteredTasksRef, upcoming: upcoming),
        from: filteredTasksProvider,
        name: r'filteredTasksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$filteredTasksHash,
        dependencies: FilteredTasksFamily._dependencies,
        allTransitiveDependencies:
            FilteredTasksFamily._allTransitiveDependencies,
        upcoming: upcoming,
      );

  FilteredTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.upcoming,
  }) : super.internal();

  final bool upcoming;

  @override
  Override overrideWith(
    FutureOr<List<Task>> Function(FilteredTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredTasksProvider._internal(
        (ref) => create(ref as FilteredTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        upcoming: upcoming,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Task>> createElement() {
    return _FilteredTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTasksProvider && other.upcoming == upcoming;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, upcoming.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredTasksRef on AutoDisposeFutureProviderRef<List<Task>> {
  /// The parameter `upcoming` of this provider.
  bool get upcoming;
}

class _FilteredTasksProviderElement
    extends AutoDisposeFutureProviderElement<List<Task>>
    with FilteredTasksRef {
  _FilteredTasksProviderElement(super.provider);

  @override
  bool get upcoming => (origin as FilteredTasksProvider).upcoming;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
