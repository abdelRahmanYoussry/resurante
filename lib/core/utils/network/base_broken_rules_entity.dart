class BaseBrokenRulesEntity {
  String propertyName;
  String message;

  BaseBrokenRulesEntity({required this.propertyName, required this.message});

  factory BaseBrokenRulesEntity.fromJson(Map<String, dynamic> json) {
    return BaseBrokenRulesEntity(
      propertyName: json["propertyName"],
      message: json["message"],
    );
  }
}
