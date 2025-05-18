import 'package:flutter/material.dart';

void showCustomDate(
  BuildContext context, {
  required TextEditingController dateController,
  ValueChanged<String>? onChanged,
}) async {
  await showDatePicker(
    context: context,
    initialDate: dateController.text.isNotEmpty ? DateTime.parse(dateController.text) : DateTime.now(),
    firstDate: DateTime(1940),
    lastDate: DateTime(21160),
    // barrierColor: Colors.transparent
  ).then((value) {
    var newDate = value!.toIso8601String().split('T').first;
    dateController.text = newDate;
    onChanged!(newDate);
  }).catchError((error) {});
}
