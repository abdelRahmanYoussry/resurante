//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sizer/sizer.dart';
//
//
// import '../app/color_manager.dart';
//
// class CustomUploadFileContainer extends StatelessWidget {
//   const CustomUploadFileContainer(
//       {super.key, required this.onTap, required this.title});
//   final VoidCallback onTap;
//   final String title;
//   String getDeviceType() {
//     final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
//     return data.size.shortestSide < 600 ? 'phone' : 'tablet';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: SizedBox(
//         width: double.infinity,
//         height: 65.h,
//         child: DottedBorder(
//           color: ColorManager.textGrey3,
//           strokeWidth: 1,
//           radius: const Radius.circular(8),
//           dashPattern: const [10, 4],
//           child: Container(
//             height: 180,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: ColorManager.white,
//             ),
//             width: double.infinity,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     ImageAssets.uploadIcon,
//                     width: getDeviceType() == 'tablet' ? 45 : 30,
//                     height: getDeviceType() == 'tablet' ? 45 : 30,
//                   ),
//                   // const SvgWidget(
//                   //   imagePath: ImageAssets.uploadIcon,
//                   // ),
//                   Text(
//                     title,
//                     style: getRegularGray12Style(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
