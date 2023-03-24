import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class UpdateTeacherBoolUseCase
    extends BaseUseCase<bool, UpdateTeacherBoolParameters> {
  BaseAuthRepository baseAuthRepository;
  UpdateTeacherBoolUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(UpdateTeacherBoolParameters parameters) {
    return baseAuthRepository.saveTeacherType(parameters);
  }
}

class UpdateTeacherBoolParameters extends Equatable {
  final bool isEnd;
  const UpdateTeacherBoolParameters({required this.isEnd});

  @override
  List<Object?> get props => [isEnd];
}
