import 'package:dartz/dartz.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetParentBoolUseCase extends BaseUseCase<bool, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  GetParentBoolUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseAuthRepository.getTeacherBool();
  }
}