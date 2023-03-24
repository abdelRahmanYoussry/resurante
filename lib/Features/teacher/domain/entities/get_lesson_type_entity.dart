import 'package:equatable/equatable.dart';

import '../../../../core/utils/network/base_entity.dart';
import '../../data/models/get_lesson_type_model.dart';

class GetLessonTypeEntity extends BaseEntityResponse with EquatableMixin {
  final List<LessonTypeData> lessonTypeData;
  GetLessonTypeEntity({
    required super.data,
    required super.succeeded,
    required super.message,
    required super.isErrorMessageJson,
    required super.brokenRules,
    required super.statusCode,
    required this.lessonTypeData,
  });
  @override
  List<Object?> get props => [
        data,
        succeeded,
        message,
        isErrorMessageJson,
        brokenRules,
        statusCode,
        lessonTypeData,
      ];
}
