// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginRemoteDataSource)
const loginRemoteDataSourceProvider = LoginRemoteDataSourceProvider._();

final class LoginRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          LoginRemoteDataSource,
          LoginRemoteDataSource,
          LoginRemoteDataSource
        >
    with $Provider<LoginRemoteDataSource> {
  const LoginRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<LoginRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoginRemoteDataSource create(Ref ref) {
    return loginRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginRemoteDataSource>(value),
    );
  }
}

String _$loginRemoteDataSourceHash() =>
    r'66878801ee487aa8126822c4cf38d1ab6d943460';

@ProviderFor(loginLocalDataSource)
const loginLocalDataSourceProvider = LoginLocalDataSourceProvider._();

final class LoginLocalDataSourceProvider
    extends
        $FunctionalProvider<
          LoginLocalDataSource,
          LoginLocalDataSource,
          LoginLocalDataSource
        >
    with $Provider<LoginLocalDataSource> {
  const LoginLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<LoginLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoginLocalDataSource create(Ref ref) {
    return loginLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginLocalDataSource>(value),
    );
  }
}

String _$loginLocalDataSourceHash() =>
    r'36dc97f99f4b2575b7171849935aa607e13626c2';

@ProviderFor(userRemoteDataSource)
const userRemoteDataSourceProvider = UserRemoteDataSourceProvider._();

final class UserRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          UserRemoteDataSource,
          UserRemoteDataSource,
          UserRemoteDataSource
        >
    with $Provider<UserRemoteDataSource> {
  const UserRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserRemoteDataSource create(Ref ref) {
    return userRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRemoteDataSource>(value),
    );
  }
}

String _$userRemoteDataSourceHash() =>
    r'16fc71934ee479c9b898480d03cc2e0aeb7b5be6';

@ProviderFor(userLocalDataSource)
const userLocalDataSourceProvider = UserLocalDataSourceProvider._();

final class UserLocalDataSourceProvider
    extends
        $FunctionalProvider<
          UserLocalDataSource,
          UserLocalDataSource,
          UserLocalDataSource
        >
    with $Provider<UserLocalDataSource> {
  const UserLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLocalDataSource create(Ref ref) {
    return userLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocalDataSource>(value),
    );
  }
}

String _$userLocalDataSourceHash() =>
    r'7927bac8546acc7af915030c4e7250b8c6311408';

@ProviderFor(loginRepository)
const loginRepositoryProvider = LoginRepositoryProvider._();

final class LoginRepositoryProvider
    extends
        $FunctionalProvider<LoginRepository, LoginRepository, LoginRepository>
    with $Provider<LoginRepository> {
  const LoginRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginRepositoryHash();

  @$internal
  @override
  $ProviderElement<LoginRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginRepository create(Ref ref) {
    return loginRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginRepository>(value),
    );
  }
}

String _$loginRepositoryHash() => r'732bd79776388b7ee5b0a7f2bf809cb436e28c79';

@ProviderFor(userRepo)
const userRepoProvider = UserRepoProvider._();

final class UserRepoProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepoHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepoHash() => r'15bfab1dd759cb290fac3120a6d063a5ec51927b';
