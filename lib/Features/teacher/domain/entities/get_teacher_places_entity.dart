import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/get_teacher_place_model.dart';

class GetTeacherPlaceEntity extends BaseEntityResponse with EquatableMixin {
  final List<TeacherPlacesData> teacherPlacesData;
  GetTeacherPlaceEntity({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required this.teacherPlacesData,
  });
  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        teacherPlacesData,
      ];
}
