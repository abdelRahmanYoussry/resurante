// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/get_privacy_policy_entity.dart';
import '../repositories/base_teacher_repository.dart';

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
