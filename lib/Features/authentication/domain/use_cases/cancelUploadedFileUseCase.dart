// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class CancelUploadedFileUseCase extends BaseUseCase<void, NoParameters> {
  BaseAuthRepository baseAuthRepository;

  CancelUploadedFileUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) {
    return baseAuthRepository.cancelFile();
  }
}
