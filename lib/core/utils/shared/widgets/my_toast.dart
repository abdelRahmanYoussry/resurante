// class MyToast {
//   static showToast(
//       {required String text,
//       required ToastState state,
//       required BuildContext context}) {
//     FToast fToast = FToast();
//     // fToast.init(NavigationService.navigatorKey.currentContext!);
//     fToast.init(context);
//     // fToast = FToast();
//     // fToast!.init(NavigationService.navigatorKey.currentContext!);
//     // if (fToast == null) {
//     //   void initToast() {
//     //
//     //     fToast!.init(NavigationService.navigatorKey.currentContext!);
//     //   }
//     // }
//     fToast.showToast(
//       child: Container(
//         width: myMediaQuery(context: context).width,
//         height: AppSize.size50.h,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//         clipBehavior: Clip.antiAlias,
//         decoration: ShapeDecoration(
//           gradient: LinearGradient(
//             begin: const Alignment(1.00, -0.08),
//             end: const Alignment(-1, 0.08),
//             colors: state == ToastState.Success
//                 ? [const Color(0xFF32BA71), const Color(0xFF2A9D8F)]
//                 : [const Color(0xFFF6743E), const Color(0xFFD42424)],
//           ),
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 width: 1,
//                 color: state == ToastState.Success
//                     ? const Color(0xFF43D590)
//                     : const Color(0xFFF0863A)),
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//             fontFamily: 'DIN Next LT Arabic',
//             fontWeight: FontWeight.w700,
//             // height: 1.2,
//           ),
//         ),
//       ),
//       toastDuration: const Duration(seconds: 2),
//       positionedToastBuilder: (context, child) {
//         return Positioned(
//           // top: 16.0,
//           bottom: 10.0,
//           width: myMediaQuery(context: context).width,
//           child: child,
//         );
//       },
//     );
//   }
// }
