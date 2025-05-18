import 'package:flutter/material.dart';

import '../app/values_manager.dart';

class MyCustomDividerSize2 extends StatelessWidget {
  const MyCustomDividerSize2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / AppSize.size170,
    );
  }
}
