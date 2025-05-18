import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:resturente/core/utils/shared/widgets/class_main_divider.dart';

class MyConditionalBuilderWithListView extends StatelessWidget {
  MyConditionalBuilderWithListView({
    required this.mapList,
    required this.buildWidget,
    Key? key,
  }) : super(key: key);
  List<Map<String, dynamic>> mapList;
  Widget buildWidget;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: mapList.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => buildWidget,
          separatorBuilder: (context, index) => const ClassesMainDivider(),
          itemCount: mapList.length,
        );
      },
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
