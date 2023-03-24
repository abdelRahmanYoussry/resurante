// ignore_for_file: file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

import '../repositories/BaseAuthRepository.dart';

class CancelUploadedFileFromListUseCase extends BaseUseCase<List<File>, int> {
  BaseAuthRepository baseAuthRepository;

  CancelUploadedFileFromListUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, List<File>>> call(int parameters) {
    return baseAuthRepository.cancelFileFromList(parameters);
  }
}
