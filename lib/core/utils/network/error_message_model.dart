import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final dynamic data;
  final bool succeeded;
  final String message;
  final bool isErrorMessageJson;
  final List<dynamic> brokenRules;
  final int statusCode;

  const ErrorMessageModel(
      {required this.data,
      required this.succeeded,
      required this.message,
      required this.isErrorMessageJson,
      required this.brokenRules,
      required this.statusCode});

  @override
  List<Object?> get props => [
        // data, succeeded,
        message,
        // isErrorMessageJson, brokenRules,
        statusCode
      ];

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      succeeded: json['succeeded'],
      message: json['message'],
      brokenRules: json['brokenRules'],
      isErrorMessageJson: json['isErrorMessageJson'],
      statusCode: json['statusCode'],
      data: json['data'].toString(),
    );
  }

  // final int statusCode;
  // final String errorMessage;
  // // final bool success;
  //
  // const ErrorMessageModel({
  //   // required this.statusCode,
  //   required this.errorMessage,
  //   // required this.success
  // });
  // // factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
  // //   return ErrorMessageModel(
  // //       // statusCode: json['statusCode'],
  // //       errorMessage: json['message']);
  // //   // success: json['success']);
  // // }
  //
  // @override
  // List<Object?> get props => [errorMessage];
}
