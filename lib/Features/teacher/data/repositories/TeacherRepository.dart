// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/teacher/domain/entities/add_complaints_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/add_place_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_cities_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_complaints_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_country_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_lesson_type_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_privacy_policy_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_student_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_teacher_personal_data_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_teacher_places_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/teacher_update_basic_data_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/update_teacher_place_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/Features/teacher/domain/use_cases/add_complaints_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/add_place_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_area_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_cities_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_common_questions_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_complaints_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_country_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_lesson_type_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_privacy_policy_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_personal_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_teacher_place_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/teacher_update_basic_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/teacher_update_user_data_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/update_teacher_places_use_case.dart';
import 'package:hassy/core/utils/error/failure.dart';

import '../../../../core/utils/error/exceptions.dart';
import '../../domain/entities/teacher_update_user_data_entity.dart';
import '../../domain/use_cases/get_student_use_case.dart';
import '../data_sources/TeacherDataSource.dart';

class TeacherRepository extends BaseTeacherRepository {
  final BaseTeacherDataSource baseTeacherDataSource;
  TeacherRepository(this.baseTeacherDataSource);
  @override
  Future<Either<Failure, GetStudentEntity>> getUserData(
      StudentParameters parameters) async {
    final result = await baseTeacherDataSource.getAllStudent(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetTeacherPersonalEntity>> getTeacherPersonalData(
      TeacherPersonalParameters parameters) async {
    final result =
        await baseTeacherDataSource.getTeacherPersonalData(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(DataBaseFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, TeacherUpdateUserDataEntity>> teacherUpdateUserData(
      TeacherUpdateUserDataParameters parameters) async {
    final updateData =
        await baseTeacherDataSource.teacherUpdateUserData(parameters);
    try {
      return Right(updateData);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateBasicUserDataEntity>> teacherUpdateBasicData(
      UpdateUserBasicDataParameters parameters) async {
    final updateBasicData =
        await baseTeacherDataSource.teacherUpdateBasicData(parameters);
    try {
      return Right(updateBasicData);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddPlaceEntity>> addPlace(
      AddPlaceParameters parameters) async {
    final addPlace = await baseTeacherDataSource.addPlace(parameters);
    try {
      return Right(addPlace);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetComplaintsEntity>> getComplaints(
      GetComplaintsParameters parameters) async {
    final getComplaintsType =
        await baseTeacherDataSource.getComplaints(parameters);
    try {
      return Right(getComplaintsType);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddComplaintsEntity>> addComplaints(
      AddComplaintsParameters parameters) async {
    final addComplaintsType =
        await baseTeacherDataSource.addComplaints(parameters);
    try {
      return Right(addComplaintsType);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetPrivacyPolicyEntity>> getPrivacyPolicy(
      GetPrivacyPolicyParameters parameters) async {
    final getPrivacyPolicy =
        await baseTeacherDataSource.getPrivacyPolicy(parameters);
    try {
      return Right(getPrivacyPolicy);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetLessonTypeEntity>> getLessonType(
      GetLessonTypeParameters parameters) async {
    final getLessonType = await baseTeacherDataSource.getLessonType(parameters);
    try {
      return Right(getLessonType);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetTeacherPlaceEntity>> getTeacherPlaces(
      GetTeacherPlaceParameters parameters) async {
    final getTeacherPlace =
        await baseTeacherDataSource.getTeacherPlaces(parameters);
    try {
      return Right(getTeacherPlace);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetPrivacyPolicyEntity>> getCommonQuestions(
      GetCommonQuestionsParameters parameters) async {
    final getCommonQuestions =
        await baseTeacherDataSource.getCommonQuestions(parameters);
    try {
      return Right(getCommonQuestions);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetCountryEntity>> getCountry(
      GetCountryParameters parameters) async {
    final getCountry = await baseTeacherDataSource.getCountry(parameters);
    try {
      return Right(getCountry);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetCitiesEntity>> getCities(
      GetCitiesParameters parameters) async {
    final getCities = await baseTeacherDataSource.getCities(parameters);
    try {
      return Right(getCities);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetCitiesEntity>> getAreas(
      GetAreasParameters parameters) async {
    final getAreas = await baseTeacherDataSource.getAreas(parameters);
    try {
      return Right(getAreas);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateTeacherPlacesEntity>> updatePlace(
      UpdateTeacherPlacesParameters parameters) async {
    final updatePlace = await baseTeacherDataSource.updatePlaces(parameters);
    try {
      return Right(updatePlace);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
