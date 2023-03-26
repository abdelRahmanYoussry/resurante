import '../../domain/entities/onboarding.dart';

class OnBoardingModel extends OnBoarding {
  const OnBoardingModel({
    required super.title,
    required super.body,
    required super.image,
  });
  factory OnBoardingModel.fromJson(Map<String, dynamic> json) =>
      OnBoardingModel(
        title: json['title'],
        body: json['body'],
        image: json['image'],
      );
}
