// ignore_for_file: unused_import, file_names

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class UploadFileUseCase extends BaseUseCase<void, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  UploadFileUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, FilePickerResult>> call(NoParameters parameters) {
    return baseAuthRepository.uploadFile();
  }
}
