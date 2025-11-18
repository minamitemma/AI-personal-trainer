import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';
import 'package:ai_personal_trainer/domain/repository/plan_repository.dart';
import 'package:ai_personal_trainer/domain/usecase/plan_generation_usecase.dart';

class PlanGenerationUseCaseImpl implements PlanGenerationUseCase {
  PlanGenerationUseCaseImpl({required PlanRepository repository})
    : _repository = repository;
  final PlanRepository _repository;

  @override
  Future<PlanResult> execute(UserInput input) async {
    if (input.weightKg <= 0 || input.heightCm <= 0) {
      throw Exception('Invalid user metrics provided.');
    }

    try {
      final PlanResult result = await _repository.generatePlan(input);

      return result;
    } on Exception catch (e) {
      throw Exception('Failed to execute plan generation: ${e.toString()}');
    }
  }
}
