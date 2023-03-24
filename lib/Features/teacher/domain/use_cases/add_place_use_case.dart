// ignore_for_file: file_names, unused_import, must_be_immutable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hassy/Features/teacher/domain/entities/add_place_entity.dart';
import 'package:hassy/Features/teacher/domain/entities/teacher_update_user_data_entity.dart';
import 'package:hassy/Features/teacher/domain/repositories/base_teacher_repository.dart';
import 'package:hassy/core/utils/error/failure.dart';
import 'package:hassy/core/utils/usecase/base_use_case.dart';

class AddPlaceUseCase extends BaseUseCase<AddPlaceEntity, AddPlaceParameters> {
  BaseTeacherRepository baseTeacherRepository;

  AddPlaceUseCase(this.baseTeacherRepository);

  @override
  Future<Either<Failure, AddPlaceEntity>> call(
      AddPlaceParameters parameters) async {
    return await baseTeacherRepository.addPlace(parameters);
  }
}

class AddPlaceParameters extends Equatable {
  final String name;
  final String cityName;
  final String countryName;
  final int areaId;
  final int countryId;
  final int cityId;
  final String streetName;
  String? longitude;
  String? latitude;
  final String token;
  AddPlaceParameters({
    required this.name,
    required this.countryName,
    required this.cityName,
    required this.areaId,
    required this.streetName,
    required this.cityId,
    required this.countryId,
    this.longitude,
    this.latitude,
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
        name,
        streetName,
        areaId,
        longitude,
        latitude,
        cityName,
        countryName,
        cityId,
        countryId,
      ];
}
