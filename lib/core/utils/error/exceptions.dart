import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const LocalDatabaseException({required this.errorMessageModel});
}

class ServerError implements Exception {
  final String errorMessageModel;

  const ServerError({required this.errorMessageModel});
}
