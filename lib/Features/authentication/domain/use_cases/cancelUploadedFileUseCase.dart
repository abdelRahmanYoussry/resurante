// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/BaseAuthRepository.dart';

class CancelUploadedFileUseCase extends BaseUseCase<void, NoParameters> {
  BaseAuthRepository baseAuthRepository;

  CancelUploadedFileUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) {
    return baseAuthRepository.cancelFile();
  }
}
