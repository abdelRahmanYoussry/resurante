// ignore_for_file: file_names

import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/BaseAuthRepository.dart';

class UploadMultiFilesUseCase extends BaseUseCase<void, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  UploadMultiFilesUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, List<File>>> call(NoParameters parameters) {
    return baseAuthRepository.uploadMultiFile();
  }
}
