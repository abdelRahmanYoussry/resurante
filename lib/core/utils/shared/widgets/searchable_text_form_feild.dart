// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:resturente/core/utils/shared/app_routes/routes_manager.dart';
// import 'package:resturente/core/utils/shared/components/components.dart';
// import 'package:resturente/core/utils/shared/widgets/svg_widget.dart';
// import 'package:resturente/core/utils/shared/widgets/textFormfield.dart';
//
//
// import '../app/assets_manager.dart';
// import '../translations/locale_keys.g.dart';
//
// class SearchableTextFormFeild extends StatefulWidget {
//   const SearchableTextFormFeild({
//     super.key,
//   });
//
//   @override
//   _SearchableTextFormFeildState createState() =>
//       _SearchableTextFormFeildState();
// }
//
// class _SearchableTextFormFeildState extends State<SearchableTextFormFeild> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: MyTextFormField(
//         readOnly: true,
//         control: _controller,
//         type: TextInputType.text,
//         contentPadding: 10,
//         onTap: () {
//           navigateTo(context, routeName: Routes.searchWidget);
//         },
//         onChanged: (value) {},
//         onSubmit: (value) {},
//         prefix: const SvgWidget(
//           imagePath: ImageAssets.searchIcon,
//         ),
//         hint: LocaleKeys.findYourClass.tr(),
//         isPassword: false,
//       ),
//     );
//   }
// }
