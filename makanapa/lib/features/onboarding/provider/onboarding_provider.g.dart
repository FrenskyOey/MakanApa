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
          AsyncValue<LoginRemoteDataSource>,
          LoginRemoteDataSource,
          FutureOr<LoginRemoteDataSource>
        >
    with
        $FutureModifier<LoginRemoteDataSource>,
        $FutureProvider<LoginRemoteDataSource> {
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
  $FutureProviderElement<LoginRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginRemoteDataSource> create(Ref ref) {
    return loginRemoteDataSource(ref);
  }
}

String _$loginRemoteDataSourceHash() =>
    r'99efcc0ba495e0a6a9cfed7f7b8b5042c9d53975';

@ProviderFor(loginLocalDataSource)
const loginLocalDataSourceProvider = LoginLocalDataSourceProvider._();

final class LoginLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoginLocalDataSource>,
          LoginLocalDataSource,
          FutureOr<LoginLocalDataSource>
        >
    with
        $FutureModifier<LoginLocalDataSource>,
        $FutureProvider<LoginLocalDataSource> {
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
  $FutureProviderElement<LoginLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginLocalDataSource> create(Ref ref) {
    return loginLocalDataSource(ref);
  }
}

String _$loginLocalDataSourceHash() =>
    r'f6759c388edc031c8655d603f596c2cff0a89277';

@ProviderFor(userRemoteDataSource)
const userRemoteDataSourceProvider = UserRemoteDataSourceProvider._();

final class UserRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserRemoteDataSource>,
          UserRemoteDataSource,
          FutureOr<UserRemoteDataSource>
        >
    with
        $FutureModifier<UserRemoteDataSource>,
        $FutureProvider<UserRemoteDataSource> {
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
  $FutureProviderElement<UserRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserRemoteDataSource> create(Ref ref) {
    return userRemoteDataSource(ref);
  }
}

String _$userRemoteDataSourceHash() =>
    r'f7c4bc2345e56ef0e8c12e06b88ed9201ea93b86';

@ProviderFor(userLocalDataSource)
const userLocalDataSourceProvider = UserLocalDataSourceProvider._();

final class UserLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserLocalDataSource>,
          UserLocalDataSource,
          FutureOr<UserLocalDataSource>
        >
    with
        $FutureModifier<UserLocalDataSource>,
        $FutureProvider<UserLocalDataSource> {
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
  $FutureProviderElement<UserLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserLocalDataSource> create(Ref ref) {
    return userLocalDataSource(ref);
  }
}

String _$userLocalDataSourceHash() =>
    r'0396d0bea87cfd2d5d39897c90d7cbef783efb2c';

@ProviderFor(loginRepository)
const loginRepositoryProvider = LoginRepositoryProvider._();

final class LoginRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoginRepository>,
          LoginRepository,
          FutureOr<LoginRepository>
        >
    with $FutureModifier<LoginRepository>, $FutureProvider<LoginRepository> {
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
  $FutureProviderElement<LoginRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoginRepository> create(Ref ref) {
    return loginRepository(ref);
  }
}

String _$loginRepositoryHash() => r'58a27e6da5a0a72982e7e84575d949c295cd5da0';

@ProviderFor(userRepo)
const userRepoProvider = UserRepoProvider._();

final class UserRepoProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserRepository>,
          UserRepository,
          FutureOr<UserRepository>
        >
    with $FutureModifier<UserRepository>, $FutureProvider<UserRepository> {
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
  $FutureProviderElement<UserRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserRepository> create(Ref ref) {
    return userRepo(ref);
  }
}

String _$userRepoHash() => r'5d4e00e202f0b122f7658a6afb13e337a94e8e9b';
