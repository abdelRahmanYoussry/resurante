// ignore_for_file: file_names
// // ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, file_names
//
// import 'package:flutter/material.dart';
//
// class MyDropDownMenuButton extends StatelessWidget {
//   Widget hint;
//   var myDropDownItems;
//   double height;
//   var context;
//   late dynamic validator;
//   late dynamic value;
//   Function? onChange;
//   Color borderColor;
//   Color labelColor;
//   Color textColor;
//   Color? dropDownColor;
//   Color? dropDownIconColor;
//   Icon? dropDownIcon;
//   AutovalidateMode? isAutoValid;
//   BorderSide borderSide = BorderSide.none;
//   MyDropDownMenuButton(
//       {Key? key,
//       required this.height,
//       required this.hint,
//       required this.borderColor,
//       required this.validator,
//       required this.textColor,
//       required this.labelColor,
//       required this.onChange,
//       required this.myDropDownItems,
//       required this.context,
//       this.dropDownColor,
//       this.dropDownIcon,
//       this.dropDownIconColor,
//       this.isAutoValid,
//       this.borderSide = BorderSide.none,
//       this.value})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       elevation: 2,
//       borderRadius: const BorderRadius.all(Radius.circular(10)),
//       onTap: () {},
//       alignment: Alignment.bottomCenter,
//       validator: validator,
//       autovalidateMode: isAutoValid,
//       // hint: hint,
//       value: value,
//       decoration: InputDecoration(
//         alignLabelWithHint: true,
//         label: hint,
//         hintStyle:
//             TextStyle(color: Theme.of(context).textTheme.subtitle1!.color!),
//         errorStyle: const TextStyle(fontSize: 14, color: Colors.red),
//         labelStyle: TextStyle(
//             color: Theme.of(context).textTheme.bodyText1!.color, fontSize: 16),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(width: 3, color: Colors.red)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(width: 3, color: Colors.red)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: borderSide,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: borderSide,
//         ),
//       ),
//       dropdownColor: dropDownColor,
//       style: TextStyle(
//           color: Theme.of(context).textTheme.subtitle1!.color!, fontSize: 14),
//       iconEnabledColor: dropDownIconColor,
//       isExpanded: true,
//       icon: dropDownIcon,
//       iconSize: 20,
//       menuMaxHeight: MediaQuery.of(context).size.height / 8,
//       focusColor: Colors.limeAccent,
//       onChanged: (value) {
//         onChange!(value);
//       },
//       items: myDropDownItems,
//     );
//   }
// }
