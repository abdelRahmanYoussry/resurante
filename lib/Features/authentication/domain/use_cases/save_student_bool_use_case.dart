import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';

class UpdateStudentBoolUseCase
    extends BaseUseCase<bool, UpdateStudentBoolParameters> {
  BaseAuthRepository baseAuthRepository;
  UpdateStudentBoolUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(UpdateStudentBoolParameters parameters) {
    return baseAuthRepository.saveStudentType(parameters);
  }
}

class UpdateStudentBoolParameters extends Equatable {
  final bool isEnd;
  const UpdateStudentBoolParameters({required this.isEnd});

  @override
  List<Object?> get props => [isEnd];
}
