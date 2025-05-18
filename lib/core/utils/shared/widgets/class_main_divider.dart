import 'package:flutter/material.dart';

class ClassesMainDivider extends StatelessWidget {
  const ClassesMainDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Container(
        width: double.infinity,
        height: 10,
        color: Colors.transparent,
      ),
    );
  }
}
