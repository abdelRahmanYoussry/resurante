import 'package:equatable/equatable.dart';

class StudentAvailableLessonsParameters extends Equatable {
  // late String token;
  late int start;
  late int length;
  List<int>? materialIds;
  String? teacherName;
  DateTime? lessonDate;
  bool? isFilterLessonDate;
  DateTime? lessonFromTime;
  DateTime? lessonToTime;
  bool? isFilterLessonTime;
  bool? isFilterRepeated;
  bool? isRepeated;
  int? lessonTypeId;
  int? cityId;
  String? title;
  double? priceFrom;
  double? priceTo;
  String? longitude;
  String? latitude;
  bool? isFilterDistance;
  bool? isFilterPrice;
  double? distanceFrom;
  double? distanceTo;
  bool? sortDateNear;
  bool? sortDateFar;
  bool? sortPriceLowToHigh;
  bool? sortPriceHighToLow;
  bool? isAvailableClass;
  bool? isReservedClass;
  bool? isPreviousReserved;
  String? txtSearchALL;

  StudentAvailableLessonsParameters({
    required this.start,
    required this.length,
    this.isAvailableClass,
    this.isReservedClass,
    this.isPreviousReserved,
    this.materialIds,
    this.isRepeated,
    this.lessonDate,
    this.lessonTypeId,
    this.title,
    this.longitude,
    this.latitude,
    this.distanceFrom,
    this.distanceTo,
    this.isFilterDistance,
    this.isFilterLessonDate,
    this.isFilterLessonTime,
    this.isFilterPrice,
    this.isFilterRepeated,
    this.lessonFromTime,
    this.lessonToTime,
    this.priceFrom,
    this.priceTo,
    this.sortDateFar,
    this.sortDateNear,
    this.sortPriceHighToLow,
    this.sortPriceLowToHigh,
    this.teacherName,
    this.cityId,
    this.txtSearchALL,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['start'] = start;
    data['length'] = length;
    // Only include non-null values
    if (materialIds != null) data['materialIds'] = materialIds;
    if (teacherName != null) data['teacherName'] = teacherName;
    if (lessonDate != null) data['lessonDate'] = lessonDate?.toIso8601String();
    if (isFilterLessonDate != null) data['isFilterLessonDate'] = isFilterLessonDate;
    if (lessonFromTime != null) data['lessonFromTime'] = lessonFromTime?.toIso8601String();
    if (lessonToTime != null) data['lessonToTime'] = lessonToTime?.toIso8601String();
    if (isFilterLessonTime != null) data['isFilterLessonTime'] = isFilterLessonTime;
    if (isFilterRepeated != null) data['isFilterRepeated'] = isFilterRepeated;
    if (isRepeated != null) data['isRepeated'] = isRepeated;
    if (lessonTypeId != null) data['lessonTypeId'] = lessonTypeId;
    if (cityId != null) data['cityId'] = cityId;
    if (title != null) data['title'] = title;
    if (priceFrom != null) data['priceFrom'] = priceFrom;
    if (priceTo != null) data['priceTo'] = priceTo;
    if (longitude != null) data['longitude'] = longitude;
    if (latitude != null) data['latitude'] = latitude;
    if (isFilterDistance != null) data['isFilterDistance'] = isFilterDistance;
    if (isFilterPrice != null) data['isFilterPrice'] = isFilterPrice;
    if (distanceFrom != null) data['distanceFrom'] = distanceFrom;
    if (distanceTo != null) data['distanceTo'] = distanceTo;
    if (sortDateNear != null) data['sortDateNear'] = sortDateNear;
    if (sortDateFar != null) data['sortDateFar'] = sortDateFar;
    if (sortPriceLowToHigh != null) data['sortPriceLowToHigh'] = sortPriceLowToHigh;
    if (sortPriceHighToLow != null) data['sortPriceHighToLow'] = sortPriceHighToLow;
    if (isAvailableClass != null) data['isAvailableClass'] = isAvailableClass;
    if (isReservedClass != null) data['isReservedClass'] = isReservedClass;
    if (isPreviousReserved != null) data['isPreviousReserved'] = isPreviousReserved;
    if (txtSearchALL != null) data['txtSearchALL'] = txtSearchALL;
    return data;
  }

  @override
  List<Object?> get props => [
        start,
        length,
        materialIds,
        isRepeated,
        lessonDate,
        lessonTypeId,
        title,
        longitude,
        latitude,
        distanceFrom,
        distanceTo,
        isFilterDistance,
        isFilterLessonDate,
        isFilterLessonTime,
        isFilterPrice,
        isFilterRepeated,
        lessonFromTime,
        lessonToTime,
        priceFrom,
        priceTo,
        sortDateFar,
        sortDateNear,
        sortPriceHighToLow,
        sortPriceLowToHigh,
        teacherName,
        cityId,
      ];
}
