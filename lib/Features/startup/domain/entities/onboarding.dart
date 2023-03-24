import 'package:equatable/equatable.dart';

class OnBoarding extends Equatable {
  final String image;
  final String title;
  final String body;
  const OnBoarding(
      {required this.title, required this.body, required this.image});

  @override
  List<Object?> get props => [image, title, body];
}
