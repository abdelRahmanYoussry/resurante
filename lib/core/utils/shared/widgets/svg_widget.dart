import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({super.key, required this.imagePath, this.color});
  final String imagePath;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: 30.h,
      width: 30.w,
      fit: BoxFit.none,
      imagePath,
      color: color,
    );
  }
}
