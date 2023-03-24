import 'package:dartz/dartz.dart';
import 'package:hassy/Features/student/domain/entities/student_personal_data_entity.dart';
import 'package:hassy/Features/student/domain/repositories/BaseStudentRepository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class GetStudentPersonalDataUseCase extends BaseUseCase<void, NoParameters> {
  BaseStudentRepository baseStudentRepository;

  GetStudentPersonalDataUseCase(this.baseStudentRepository);

  @override
  Future<Either<Failure, StudentPersonalDataEntity>> call(
      NoParameters parameters) {
    return baseStudentRepository.getStudentPersonalData();
  }
}
