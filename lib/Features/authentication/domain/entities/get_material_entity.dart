// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/teacher_material_model.dart';

class TeacherMaterialEntity extends BaseEntityResponse with EquatableMixin {
  final List<TeacherMaterials> materials;
  TeacherMaterialEntity({
    required this.materials,
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
  });

  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        materials
      ];
}
