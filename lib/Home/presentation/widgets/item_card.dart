import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/Home/data/models/item_model.dart';
import 'package:resturente/core/utils/shared/app/assets_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';
import 'package:resturente/core/utils/shared/widgets/svg_widget.dart';

import '../../../core/utils/shared/app/color_manager.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemModel,
    required this.onTap,
  });
  final ItemModel itemModel;
  final dynamic onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 310.h,
        width: 185.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  itemModel.imagePath,
                ),
              ),
              Text(
                itemModel.name,
                style: getBoldBlack16Style(),
              ),
              Text(
                itemModel.title,
                style: getRegularBlack16Style(),
              ),
              SizedBox(
                height: 9.h,
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      itemModel.rate,
                      style: getRegularBlack16Style(),
                    ),
                    const Spacer(),
                    const SvgWidget(
                      imagePath: ImageAssets.emptyHeartIcon,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
