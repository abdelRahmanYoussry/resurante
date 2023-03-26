import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/base_onboarding_repository.dart';

class GetOnBoardingViewUseCase extends BaseUseCase<bool, NoParameters> {
  BaseOnBoardingRepository baseOnBoardingRepository;
  GetOnBoardingViewUseCase(this.baseOnBoardingRepository);
  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseOnBoardingRepository.getBoarding();
  }
}
