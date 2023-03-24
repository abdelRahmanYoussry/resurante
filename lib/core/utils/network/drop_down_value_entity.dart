// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dropdown_textfield/dropdown_textfield.dart';

class DropDownEntity extends DropDownValueModel {
  DropDownEntity({required super.name, required super.value});

  factory DropDownEntity.fromJson(Map<String, dynamic> json) {
    return DropDownEntity(name: json['name'], value: json['id']);
  }
//
}
