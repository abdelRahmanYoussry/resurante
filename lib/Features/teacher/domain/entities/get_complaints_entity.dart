// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/get_complaints_model.dart';

class GetComplaintsEntity extends BaseEntityResponse with EquatableMixin {
  final List<ComplaintsData> complaintsData;
  GetComplaintsEntity({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required this.complaintsData,
  });
  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        complaintsData,
      ];
}
