// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/get_country_model.dart';

class GetCitiesEntity extends BaseEntityResponse with EquatableMixin {
  final List<LocationData> locationData;
  GetCitiesEntity({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required this.locationData,
  });
  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        locationData,
      ];
}
