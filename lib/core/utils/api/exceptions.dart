import 'package:flutter/material.dart';

class ServerException extends Equatable implements Exception {
  final String? message;
  final Function? errorFunction;
  const ServerException([this.message, this.errorFunction]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  void navigateToLogin({required BuildContext context}) {
    navigateAndFinish(context, routeName: Routes.loginRoute);
  }

  const UnauthorizedException([message, function])
      : super("Unauthorized", function);
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super("Requested Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
      : super("No Internet Connection");
}

class CacheException implements Exception {}
