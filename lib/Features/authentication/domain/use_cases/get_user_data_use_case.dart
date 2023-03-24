// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/uesr_data_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class GetUserDataUseCase
    extends BaseUseCase<UserDataEntity, UserDataParameters> {
  BaseAuthRepository baseAuthRepository;
  GetUserDataUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, UserDataEntity>> call(UserDataParameters parameters) {
    return baseAuthRepository.getUserData(parameters);
  }
}

class UserDataParameters extends Equatable {
  final String token;
  const UserDataParameters({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
