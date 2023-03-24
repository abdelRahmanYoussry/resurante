// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/startup/domain/repositories/base_onboarding_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class UpdateOnBoardingViewUseCase
    extends BaseUseCase<bool, UpdateOnBoardingParameters> {
  BaseOnBoardingRepository baseOnBoardingRepository;
  UpdateOnBoardingViewUseCase(this.baseOnBoardingRepository);
  @override
  Future<Either<Failure, bool>> call(UpdateOnBoardingParameters parameters) {
    return baseOnBoardingRepository.updateBoarding(parameters);
  }
}

class UpdateOnBoardingParameters extends Equatable {
  final bool isEnd;
  const UpdateOnBoardingParameters({required this.isEnd});

  @override
  List<Object?> get props => [isEnd];
}
