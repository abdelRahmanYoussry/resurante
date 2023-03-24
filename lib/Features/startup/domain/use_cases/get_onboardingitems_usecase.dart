import 'package:dartz/dartz.dart';
import 'package:hassy/Features/startup/domain/repositories/base_onboarding_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetOnBoardingViewUseCase extends BaseUseCase<bool, NoParameters> {
  BaseOnBoardingRepository baseOnBoardingRepository;
  GetOnBoardingViewUseCase(this.baseOnBoardingRepository);
  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseOnBoardingRepository.getBoarding();
  }
}
