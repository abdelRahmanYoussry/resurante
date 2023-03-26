import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../repositories/BaseAuthRepository.dart';

class GetParentBoolUseCase extends BaseUseCase<bool, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  GetParentBoolUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseAuthRepository.getTeacherBool();
  }
}
