class BaseDataEntity {
  dynamic data;

  BaseDataEntity({required this.data});

  factory BaseDataEntity.fromJson(Map<String, dynamic> json) {
    return BaseDataEntity(data: json['data']);
  }
}
