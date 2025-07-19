// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_only_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readOnlyHash() => r'68796f9688e6ea608c881ac1888d09bd098d4a9c';

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

abstract class _$ReadOnly extends BuildlessAutoDisposeNotifier<bool> {
  late final int? id;

  bool build(int? id);
}

/// See also [ReadOnly].
@ProviderFor(ReadOnly)
const readOnlyProvider = ReadOnlyFamily();

/// See also [ReadOnly].
class ReadOnlyFamily extends Family<bool> {
  /// See also [ReadOnly].
  const ReadOnlyFamily();

  /// See also [ReadOnly].
  ReadOnlyProvider call(int? id) {
    return ReadOnlyProvider(id);
  }

  @override
  ReadOnlyProvider getProviderOverride(covariant ReadOnlyProvider provider) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'readOnlyProvider';
}

/// See also [ReadOnly].
class ReadOnlyProvider extends AutoDisposeNotifierProviderImpl<ReadOnly, bool> {
  /// See also [ReadOnly].
  ReadOnlyProvider(int? id)
    : this._internal(
        () => ReadOnly()..id = id,
        from: readOnlyProvider,
        name: r'readOnlyProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$readOnlyHash,
        dependencies: ReadOnlyFamily._dependencies,
        allTransitiveDependencies: ReadOnlyFamily._allTransitiveDependencies,
        id: id,
      );

  ReadOnlyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int? id;

  @override
  bool runNotifierBuild(covariant ReadOnly notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(ReadOnly Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReadOnlyProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ReadOnly, bool> createElement() {
    return _ReadOnlyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReadOnlyProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReadOnlyRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  int? get id;
}

class _ReadOnlyProviderElement
    extends AutoDisposeNotifierProviderElement<ReadOnly, bool>
    with ReadOnlyRef {
  _ReadOnlyProviderElement(super.provider);

  @override
  int? get id => (origin as ReadOnlyProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
