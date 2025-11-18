// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$planRepositoryHash() => r'5caaedf22cad4bbd490952700f6161fa86709944';

/// 1. PlanApiClient の抽象化プロバイダ
/// 2. PlanRepository のプロバイダ (リポジトリ層の具象実装を提供)
///
/// Copied from [planRepository].
@ProviderFor(planRepository)
final planRepositoryProvider = AutoDisposeProvider<PlanRepository>.internal(
  planRepository,
  name: r'planRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$planRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlanRepositoryRef = AutoDisposeProviderRef<PlanRepository>;
String _$planGenerationUseCaseHash() =>
    r'b18c6d56dcc1661c00067afaf6d5c8fb3fb2a5dd';

/// 3. PlanGenerationUseCase のプロバイダ (UIが直接利用する機能)
///
/// Copied from [planGenerationUseCase].
@ProviderFor(planGenerationUseCase)
final planGenerationUseCaseProvider =
    AutoDisposeProvider<PlanGenerationUseCase>.internal(
      planGenerationUseCase,
      name: r'planGenerationUseCaseProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$planGenerationUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlanGenerationUseCaseRef =
    AutoDisposeProviderRef<PlanGenerationUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
