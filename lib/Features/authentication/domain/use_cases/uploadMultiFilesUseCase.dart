// ignore_for_file: file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class UploadMultiFilesUseCase extends BaseUseCase<void, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  UploadMultiFilesUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, List<File>>> call(NoParameters parameters) {
    return baseAuthRepository.uploadMultiFile();
  }
}
