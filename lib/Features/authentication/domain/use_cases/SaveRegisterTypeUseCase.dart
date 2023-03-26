// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/BaseAuthRepository.dart';

class SaveUserRegisterTypeUseCase
    extends BaseUseCase<bool, UserRegisterTypeParameters> {
  BaseAuthRepository baseAuthRepository;
  SaveUserRegisterTypeUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(UserRegisterTypeParameters parameters) {
    return baseAuthRepository.saveUserRegisterType(parameters);
  }
}

class UserRegisterTypeParameters extends Equatable {
  final String type;
  const UserRegisterTypeParameters({required this.type});

  @override
  List<Object?> get props => [type];
}
