import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hassy/Features/authentication/domain/repositories/BaseAuthRepository.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/usecase/base_use_case.dart';
import '../entities/user_login_entity.dart';

class UserLoginUseCase
    extends BaseUseCase<UserLoginEntity, UserLoginParameters> {
  BaseAuthRepository baseAuthRepository;
  UserLoginUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, UserLoginEntity>> call(
      UserLoginParameters parameters) async {
    return await baseAuthRepository.userLogin(parameters);
  }
}

class UserLoginParameters extends Equatable {
  final String userName;
  final String password;
  const UserLoginParameters({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
