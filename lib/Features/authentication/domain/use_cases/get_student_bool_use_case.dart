import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/BaseAuthRepository.dart';

class GetStudentBoolUseCase extends BaseUseCase<bool, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  GetStudentBoolUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseAuthRepository.getStudentBool();
  }
}
