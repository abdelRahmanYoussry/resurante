import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';

class Rating extends StatelessWidget {
  final double rate;
  final double iconSize;
  Color color = Colors.amber;
  TextStyle rateTextStyle = getRegularBlack10Style();
  final bool isClassWidget;
  Rating({
    Key? key,
    required this.rate,
    this.iconSize = 16,
    this.color = Colors.amber,
    this.isClassWidget = true,
  }) : super(key: key);
  String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 55.w,
      // height: 40.h,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: ShapeDecoration(
        color: ColorManager.mainObjectsBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: getDeviceType() == 'tablet'
            ? const EdgeInsets.all(5.0)
            : EdgeInsets.zero,
        child: RatingBarIndicator(
          itemPadding: EdgeInsets.zero,
          rating: rate,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                rate.toDouble().toString(),
                style: isClassWidget
                    ? getRegularBlack10Style()
                    : getBoldBlue22Style(),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.star,
                color: color,
                size: 25,
              ),
            ],
          ),
          itemCount: 1,
          itemSize: getDeviceType() == 'tablet' ? 60 : 40,
          direction: Axis.horizontal,
        ),
      ),
    );
  }
}
