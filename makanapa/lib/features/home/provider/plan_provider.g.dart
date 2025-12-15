// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(planRemoteDataSource)
const planRemoteDataSourceProvider = PlanRemoteDataSourceProvider._();

final class PlanRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PlanRemoteDataSource,
          PlanRemoteDataSource,
          PlanRemoteDataSource
        >
    with $Provider<PlanRemoteDataSource> {
  const PlanRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PlanRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlanRemoteDataSource create(Ref ref) {
    return planRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanRemoteDataSource>(value),
    );
  }
}

String _$planRemoteDataSourceHash() =>
    r'074a3f9bbb39bf4866461e9f3b024a21843f9668';

@ProviderFor(planLocalDataSource)
const planLocalDataSourceProvider = PlanLocalDataSourceProvider._();

final class PlanLocalDataSourceProvider
    extends
        $FunctionalProvider<
          PlanLocalDataSource,
          PlanLocalDataSource,
          PlanLocalDataSource
        >
    with $Provider<PlanLocalDataSource> {
  const PlanLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<PlanLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlanLocalDataSource create(Ref ref) {
    return planLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanLocalDataSource>(value),
    );
  }
}

String _$planLocalDataSourceHash() =>
    r'32f469c7fbdc31830abb5ca904e5af996af44ef2';

@ProviderFor(mealPlanRepository)
const mealPlanRepositoryProvider = MealPlanRepositoryProvider._();

final class MealPlanRepositoryProvider
    extends
        $FunctionalProvider<
          MealPlanRepository,
          MealPlanRepository,
          MealPlanRepository
        >
    with $Provider<MealPlanRepository> {
  const MealPlanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealPlanRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealPlanRepositoryHash();

  @$internal
  @override
  $ProviderElement<MealPlanRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MealPlanRepository create(Ref ref) {
    return mealPlanRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MealPlanRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MealPlanRepository>(value),
    );
  }
}

String _$mealPlanRepositoryHash() =>
    r'6b99a0afb2023d32f5c42898f8b5a49042ffcce0';
