// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/startup/domain/use_cases/change_language_use_case.dart';

import '../../../../core/utils/error/failure.dart';
import '../entities/onboarding.dart';
import '../use_cases/update_boarding_view_use_case.dart';

abstract class BaseOnBoardingRepository {
  Future<Either<Failure, bool>> updateBoarding(
      UpdateOnBoardingParameters parameters);
  Future<Either<Failure, bool>> getBoarding();
  Future<Either<Failure, bool>> changeLanguage(
      ChangeLanguageParameters parameters);
  Future<Either<Failure, String>> getSavedLanguage();
}
