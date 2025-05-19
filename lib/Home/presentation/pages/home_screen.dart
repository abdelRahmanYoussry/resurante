import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';
import 'package:resturente/core/utils/shared/widgets/textFormfield.dart';

import '../../../core/utils/shared/app/assets_manager.dart';
import '../../../core/utils/shared/app/strings_manager.dart';
import '../../../core/utils/shared/widgets/svg_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController control = TextEditingController();

  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    tabController!.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppStrings.appName,
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 45,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Order your favourite food!',
                        style: getMediumBlack16Style(),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: Image.asset(
                      ImageAssets.userImage,
                      height: 60.h,
                      width: 60.w,
                    ).image,
                  )
                ],
              ),
              SizedBox(
                height: 47.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250.w,
                    height: 60.h,
                    child: MyTextFormField(
                      readOnly: false,
                      control: control,
                      label: 'Search',
                      prefix: const SvgWidget(
                        imagePath: ImageAssets.searchBlackIcon,
                      ),
                      type: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: ColorManager.mainPrimaryColor4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      ImageAssets.settingsIcon,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 56.h,
              ),
              DefaultTabController(
                length: 4,
                child: ButtonsTabBar(
                  radius: 20,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  borderWidth: 2,
                  borderColor: Colors.transparent,
                  unselectedBorderColor: ColorManager.transparentColor,
                  controller: tabController,
                  center: false,
                  decoration: BoxDecoration(
                    color: ColorManager.mainPrimaryColor4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  unselectedLabelStyle: getMediumGrey16Style(),
                  onTap: (index) {
                    setState(
                      () {
                        tabController!.index = index;
                      },
                    );
                  },
                  unselectedBackgroundColor:
                      ColorManager.mainObjectsBackGroundColor,
                  labelStyle: getMediumWhite16Style(),
                  height: 50,
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Combos",
                    ),
                    Tab(
                      text: "Sliders",
                    ),
                    Tab(
                      text: "Offers",
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
