import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/BaseAuthRepository.dart';

class UpdateParentBoolUseCase
    extends BaseUseCase<bool, UpdateParentBoolParameters> {
  BaseAuthRepository baseAuthRepository;
  UpdateParentBoolUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(UpdateParentBoolParameters parameters) {
    return baseAuthRepository.saveParentType(parameters);
  }
}

class UpdateParentBoolParameters extends Equatable {
  final bool isEnd;
  const UpdateParentBoolParameters({required this.isEnd});

  @override
  List<Object?> get props => [isEnd];
}
