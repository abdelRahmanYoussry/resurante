// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/Register_initial_entitiy.dart';
import '../repositories/BaseAuthRepository.dart';

class InitialRegisterUseCase
    extends BaseUseCase<InitialRegisterEntity, InitialRegisterParameters> {
  BaseAuthRepository baseAuthRepository;

  InitialRegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, InitialRegisterEntity>> call(
      InitialRegisterParameters parameters) async {
    return await baseAuthRepository.initialRegister(parameters);
  }
}

class InitialRegisterParameters {
  String userName;
  String password;
  String passwordConfirmed;
  String phone;
  String typeId;

  InitialRegisterParameters(
      {required this.userName,
      required this.password,
      required this.passwordConfirmed,
      required this.phone,
      required this.typeId});
}
