// ファイルパス: lib/domain/usecase/plan_providers.dart

import 'package:ai_personal_trainer/domain/repository/plan_repository.dart'; // 抽象リポジトリ
import 'package:ai_personal_trainer/domain/usecase/plan_generation_usecase.dart';
import 'package:ai_personal_trainer/domain/usecase/plan_generation_usecase_impl.dart';
import 'package:ai_personal_trainer/infrastructure/api_client/plan_api_client.dart';
import 'package:ai_personal_trainer/infrastructure/repository/dio_plan_repository.dart'; // 具象リポジトリ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plan_providers.g.dart';

@riverpod
PlanRepository planRepository(Ref ref) {
  final apiClient = ref.watch(planApiClientProvider);

  return DioPlanRepository(apiClient: apiClient);
}

@riverpod
PlanGenerationUseCase planGenerationUseCase(Ref ref) {
  final repository = ref.watch(planRepositoryProvider);

  return PlanGenerationUseCaseImpl(repository: repository);
}
