// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/get_material_entity.dart';
import '../repositories/BaseAuthRepository.dart';

class GetTeacherMaterialUseCase
    extends BaseUseCase<TeacherMaterialEntity, NoParameters> {
  BaseAuthRepository baseAuthRepository;
  GetTeacherMaterialUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, TeacherMaterialEntity>> call(NoParameters parameters) {
    return baseAuthRepository.getMaterial(parameters);
  }
}

// class TeacherMaterialParameters extends Equatable {
//   final String token;
//   const TeacherMaterialParameters({
//     required this.token,
//   });
//   @override
//   List<Object?> get props => [token];
// }
