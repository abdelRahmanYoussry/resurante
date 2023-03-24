import 'package:flutter/material.dart';

import '../app/values_manager.dart';

class MyCustomDividerSize5 extends StatelessWidget {
  const MyCustomDividerSize5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}
