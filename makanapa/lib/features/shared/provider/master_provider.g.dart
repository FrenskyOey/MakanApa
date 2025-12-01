// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioClients)
const dioClientsProvider = DioClientsProvider._();

final class DioClientsProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioClientsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioClientsHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioClientsHash() => r'41b64f25519ad52df01bdf58a15746341eb55af0';

@ProviderFor(supabaseClients)
const supabaseClientsProvider = SupabaseClientsProvider._();

final class SupabaseClientsProvider
    extends $FunctionalProvider<SupabaseClient, SupabaseClient, SupabaseClient>
    with $Provider<SupabaseClient> {
  const SupabaseClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseClientsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseClientsHash();

  @$internal
  @override
  $ProviderElement<SupabaseClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseClient create(Ref ref) {
    return supabaseClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseClient>(value),
    );
  }
}

String _$supabaseClientsHash() => r'628786a78daf2eba6623dccfe45ef885651ee19a';

@ProviderFor(sharedPreferenceClients)
const sharedPreferenceClientsProvider = SharedPreferenceClientsProvider._();

final class SharedPreferenceClientsProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  const SharedPreferenceClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferenceClientsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferenceClientsHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferenceClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferenceClientsHash() =>
    r'45540fe1fc7038c7dd046a1101305a47729a0821';

@ProviderFor(devicConfigClient)
const devicConfigClientProvider = DevicConfigClientProvider._();

final class DevicConfigClientProvider
    extends $FunctionalProvider<DeviceConfig, DeviceConfig, DeviceConfig>
    with $Provider<DeviceConfig> {
  const DevicConfigClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicConfigClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicConfigClientHash();

  @$internal
  @override
  $ProviderElement<DeviceConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceConfig create(Ref ref) {
    return devicConfigClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceConfig>(value),
    );
  }
}

String _$devicConfigClientHash() => r'12f81365aedd922276d9c5bc8eacde93a062adee';

@ProviderFor(isarClients)
const isarClientsProvider = IsarClientsProvider._();

final class IsarClientsProvider extends $FunctionalProvider<Isar, Isar, Isar>
    with $Provider<Isar> {
  const IsarClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isarClientsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isarClientsHash();

  @$internal
  @override
  $ProviderElement<Isar> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Isar create(Ref ref) {
    return isarClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Isar value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Isar>(value),
    );
  }
}

String _$isarClientsHash() => r'2060f3d3aa3c1563bc0d7c34d6892bec8f7f63a6';
