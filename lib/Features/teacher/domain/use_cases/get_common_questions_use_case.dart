// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/get_privacy_policy_entity.dart';

class GetCommonQuestionsUseCase
    extends BaseUseCase<GetPrivacyPolicyEntity, GetCommonQuestionsParameters> {
  BaseTeacherRepository baseStudentRepository;
  GetCommonQuestionsUseCase(this.baseStudentRepository);
  @override
  Future<Either<Failure, GetPrivacyPolicyEntity>> call(
      GetCommonQuestionsParameters parameters) {
    return baseStudentRepository.getCommonQuestions(parameters);
  }
}

class GetCommonQuestionsParameters extends Equatable {
  final String token;
  const GetCommonQuestionsParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
