import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spicy',
          style: getMediumBlack16Style(),
        ),
        SizedBox(
          width: 120.w,
          child: Slider(
            value: _sliderValue,
            min: 0,
            max: 40,
            divisions: 100,
            activeColor: ColorManager.mainPrimaryColor4,
            label: _sliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mild',
                style: getMediumGreen12Style(),
              ),
              SizedBox(
                width: 50.w,
              ),
              Text(
                'Hot',
                style: getMediumRed12Style(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
