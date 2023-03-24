// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../entities/Register_Step2_entity.dart';
import '../entities/Register_initial_entitiy.dart';
import '../repositories/BaseAuthRepository.dart';

class UserRegisterStepTwoUseCase
    extends BaseUseCase<RegisterStepTwoEntity, RegisterStepTwoParameters> {
  BaseAuthRepository baseAuthRepository;

  UserRegisterStepTwoUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, RegisterStepTwoEntity>> call(
      RegisterStepTwoParameters parameters) async {
    return await baseAuthRepository.registerStepTwo(parameters);
  }
}

class RegisterStepTwoParameters extends Equatable {
  final String fullName;
  final String idNumber;
  final String address;
  final String birthDate;
  final String email;
  File? image;
  final String token;
  RegisterStepTwoParameters({
    required this.token,
    required this.fullName,
    required this.idNumber,
    required this.address,
    required this.birthDate,
    required this.email,
    this.image,
  });

  @override
  List<Object?> get props => [
        token,
        fullName,
        idNumber,
        address,
        birthDate,
        email,
        image,
      ];
}
