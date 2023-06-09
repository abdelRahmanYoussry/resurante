// ignore_for_file: unused_local_variable, unused_import

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/error/exceptions.dart';
import '../../../../core/utils/error/failure.dart';
import '../../domain/entities/onboarding.dart';
import '../../domain/repositories/base_onboarding_repository.dart';
import '../data_sources/onboarding_local_data_source.dart';

class OnBoardingRepository extends BaseOnBoardingRepository {
  final BaseOnBoardingLocalDataSource baseOnBoardingLocalDataSource;

  OnBoardingRepository(this.baseOnBoardingLocalDataSource);
  @override
  Future<Either<Failure, bool>> getBoarding() async {
    final getBoardingValue =
        await baseOnBoardingLocalDataSource.getLastOnBoarding();
    try {
      return Right(getBoardingValue);
    } on LocalDatabaseException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> updateBoarding(
      UpdateOnBoardingParameters parameters) async {
    final updateOnBoardingView =
        await baseOnBoardingLocalDataSource.cacheOnBoarding(parameters);
    try {
      return Right(updateOnBoardingView);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> changeLanguage(
      ChangeLanguageParameters parameters) async {
    final lanCode =
        await baseOnBoardingLocalDataSource.changeLanguage(parameters);
    try {
      return Right(lanCode);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLanguage() async {
    final lanCode = await baseOnBoardingLocalDataSource.getSavedLanguage();
    try {
      return Right(lanCode);
    } on LocalDatabaseException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }
}
