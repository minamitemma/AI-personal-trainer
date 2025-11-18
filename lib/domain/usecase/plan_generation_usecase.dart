import 'package:ai_personal_trainer/domain/model/plan_result.dart';
import 'package:ai_personal_trainer/domain/model/user_input.dart';

abstract class PlanGenerationUseCase {
  Future<PlanResult> execute(UserInput input);
}
