import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/startup/domain/repositories/base_onboarding_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class ChangeLanguageUseCase extends BaseUseCase<bool, ChangeLanguageParameters> {
  BaseOnBoardingRepository baseOnBoardingRepository;
  ChangeLanguageUseCase(this.baseOnBoardingRepository);
  @override
  Future<Either<Failure, bool>> call(ChangeLanguageParameters parameters) {
    return baseOnBoardingRepository.changeLanguage(parameters);
  }
}

class ChangeLanguageParameters extends Equatable {
  final String local;
  const ChangeLanguageParameters({required this.local});

  @override
  List<Object?> get props => [local];
}
