import 'package:flutter/material.dart';

void showCustomTimePicker(
  BuildContext context, {
  required TextEditingController timeController,
}) async {
  await showTimePicker(
    context: context,
    initialTime: timeController.text.isNotEmpty
        ? timeConvert(timeController.text)
        : TimeOfDay.now(),
  ).then((value) {
    debugPrint('${value!.format(context)} value');
    timeController.text = value
        .format(context)
        .toString()
        .replaceAll('م', 'PM')
        .replaceAll('ص', 'AM');
    // startTime = DateFormat.jm('en')
    //     .parse(timeController.text);
    debugPrint(timeController.text.toString());
  }).catchError((error) {
    debugPrint(error.toString());
  });
}

TimeOfDay timeConvert(String normTime) {
  int hour;
  int minute;
  String time = normTime.substring(normTime.length - 2);
  String result = normTime.substring(0, normTime.indexOf(' '));
  if (time == 'AM' && int.parse(result.split(":")[1]) != 12) {
    hour = int.parse(result.split(':')[0]);
    if (hour == 12) hour = 0;
    minute = int.parse(result.split(":")[1]);
  } else {
    hour = int.parse(result.split(':')[0]) - 12;
    if (hour <= 0) {
      hour = 24 + hour;
    }
    minute = int.parse(result.split(":")[1]);
  }
  return TimeOfDay(hour: hour, minute: minute);
}
