import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/base_onboarding_repository.dart';

class GetSavedLocalLanUseCase extends BaseUseCase<String, NoParameters> {
  BaseOnBoardingRepository baseOnBoardingRepository;
  GetSavedLocalLanUseCase(this.baseOnBoardingRepository);
  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await baseOnBoardingRepository.getSavedLanguage();
  }
}
