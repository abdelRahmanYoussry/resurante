import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/Home/data/models/item_model.dart';
import 'package:resturente/core/utils/shared/widgets/custom_app_bar.dart';
import 'package:resturente/core/utils/shared/widgets/elevatedButton.dart';

import '../../../core/utils/shared/app/color_manager.dart';
import '../../../core/utils/shared/app/styles_manager.dart';
import '../../../core/utils/shared/components/components.dart';
import '../widgets/slider_widget.dart';

class ItemDetailsScreen extends StatefulWidget {
  ItemDetailsScreen({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(''),
        mycolor: ColorManager.white,
        isLeading: true,
        toolBarHeight: myMediaQuery(context: context).height / 14,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    widget.itemModel.imagePath,
                    fit: BoxFit.contain,
                    height: 200.h,
                    width: 200.w,
                  ),
                ),
                Text(
                  widget.itemModel.subTitle,
                  style: getBoldBlack25Style(),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      widget.itemModel.rate,
                      style: getMediumGrey15Style(),
                    ),
                    Text(
                      ' - ${widget.itemModel.timeDescription}',
                      style: getMediumGrey16Style(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19.h,
                ),
                Text(
                  widget.itemModel.description,
                  style: getRegularGray16Style(),
                ),
                SizedBox(
                  height: 56.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SliderWidget(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Protein',
                          style: getMediumBlack16Style(),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (value == 0) {
                                  return;
                                } else {
                                  setState(() {
                                    value--;
                                  });
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.mainPrimaryColor4,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Center(
                                  child: Text(
                                    '-',
                                    style: getBoldWhite18Style(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '$value',
                              style: getMediumBlack16Style(),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  value++;
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: ColorManager.mainPrimaryColor4,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: getBoldWhite18Style(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 98.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: ColorManager.mainPrimaryColor4,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text(
                      widget.itemModel.price,
                      style: getBoldWhite18Style(),
                    ),
                  ),
                ),
                SizedBox(
                  child: MyElevatedButton(
                    onTap: () {},
                    width: 239.w,
                    height: 60.h,
                    buttonName: 'Order Now',
                    buttonColor: ColorManager.black,
                    borderColor: ColorManager.black,
                    borderWidth: 1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailsArguments {
  final ItemModel itemModel;
  ItemDetailsArguments({required this.itemModel});
}
