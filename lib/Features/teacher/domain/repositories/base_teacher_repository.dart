import 'package:dartz/dartz.dart';
import 'package:hassy/Features/teacher/domain/entities/add_place_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_cities_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_complaints_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/get_student_entity.dart';
import 'package:hassy/Features/teacher/domain/use_cases/add_place_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_cities_use_case.dart';
import 'package:hassy/Features/teacher/domain/use_cases/get_complaints_use_case.dart';

import '../../../../core/utils/error/failure.dart';
import '../entities/add_complaints_entity.dart';
import '../entities/get_country_entity.dart';
import '../entities/get_lesson_type_entity.dart';
import '../entities/get_privacy_policy_entity.dart';
import '../entities/get_teacher_personal_data_entity.dart';
import '../entities/get_teacher_places_entity.dart';
import '../entities/teacher_update_basic_data_entity.dart';
import '../entities/teacher_update_user_data_entity.dart';
import '../entities/update_teacher_place_entity.dart';
import '../use_cases/add_complaints_use_case.dart';
import '../use_cases/get_area_use_case.dart';
import '../use_cases/get_common_questions_use_case.dart';
import '../use_cases/get_country_use_case.dart';
import '../use_cases/get_lesson_type_use_case.dart';
import '../use_cases/get_privacy_policy_use_case.dart';
import '../use_cases/get_student_use_case.dart';
import '../use_cases/get_teacher_personal_data_use_case.dart';
import '../use_cases/get_teacher_place_use_case.dart';
import '../use_cases/teacher_update_basic_data_use_case.dart';
import '../use_cases/teacher_update_user_data_use_case.dart';
import '../use_cases/update_teacher_places_use_case.dart';

abstract class BaseTeacherRepository {
  Future<Either<Failure, GetStudentEntity>> getUserData(
      StudentParameters parameters);
  Future<Either<Failure, GetTeacherPersonalEntity>> getTeacherPersonalData(
      TeacherPersonalParameters parameters);
  Future<Either<Failure, TeacherUpdateUserDataEntity>> teacherUpdateUserData(
      TeacherUpdateUserDataParameters parameters);
  Future<Either<Failure, UpdateBasicUserDataEntity>> teacherUpdateBasicData(
      UpdateUserBasicDataParameters parameters);
  Future<Either<Failure, AddPlaceEntity>> addPlace(
      AddPlaceParameters parameters);
  Future<Either<Failure, GetComplaintsEntity>> getComplaints(
      GetComplaintsParameters parameters);
  Future<Either<Failure, AddComplaintsEntity>> addComplaints(
      AddComplaintsParameters parameters);
  Future<Either<Failure, GetPrivacyPolicyEntity>> getPrivacyPolicy(
      GetPrivacyPolicyParameters parameters);
  Future<Either<Failure, GetLessonTypeEntity>> getLessonType(
      GetLessonTypeParameters parameters);
  Future<Either<Failure, GetTeacherPlaceEntity>> getTeacherPlaces(
      GetTeacherPlaceParameters parameters);
  Future<Either<Failure, GetPrivacyPolicyEntity>> getCommonQuestions(
      GetCommonQuestionsParameters parameters);
  Future<Either<Failure, GetCountryEntity>> getCountry(
      GetCountryParameters parameters);
  Future<Either<Failure, GetCitiesEntity>> getCities(
      GetCitiesParameters parameters);
  Future<Either<Failure, GetCitiesEntity>> getAreas(
      GetAreasParameters parameters);
  Future<Either<Failure, UpdateTeacherPlacesEntity>> updatePlace(
      UpdateTeacherPlacesParameters parameters);
}
