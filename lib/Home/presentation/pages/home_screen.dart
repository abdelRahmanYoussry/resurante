import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturente/Home/data/models/item_model.dart';
import 'package:resturente/Home/presentation/pages/item_details_screen.dart';
import 'package:resturente/Home/presentation/widgets/item_card.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/app/styles_manager.dart';
import 'package:resturente/core/utils/shared/app_routes/routes_manager.dart';
import 'package:resturente/core/utils/shared/components/components.dart';
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
  final List<ItemModel> foodItems = [
    ItemModel(
      imagePath: ImageAssets.itemImage,
      name: 'Cheeseburger',
      title: "Wendy's Burger",
      rate: '4.9',
      description:
          'The Cheeseburger Wendy\'s Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it\'s topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.',
      subTitle: 'Cheeseburger Wendy\'s Burger',
      timeDescription: '26 mins',
      price: '\$8.24',
    ),
    ItemModel(
      imagePath: ImageAssets.item2Image,
      name: 'Hamburger',
      title: 'Veggie Burger',
      rate: '4.8',
      description:
          'Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ',
      subTitle: 'Hamburger Veggie Burger',
      timeDescription: '14 mins',
      price: '\$9.99',
    ),
    ItemModel(
        imagePath: ImageAssets.item3Image,
        name: 'Hamburger',
        title: 'Chicken Burger',
        rate: '4.6',
        description:
            'Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!',
        subTitle: 'Hamburger Chicken Burger',
        timeDescription: '42 mins',
        price: '\$12.48'),
    ItemModel(
        imagePath: ImageAssets.item4Image,
        name: 'Hamburger',
        title: 'Fried Chicken Burger',
        rate: '4.5',
        description:
            'Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.',
        subTitle: 'Fried Chicken Burger',
        timeDescription: '14 mins',
        price: '\$26.99'),
  ];

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
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
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
                  height: 41.h,
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
                    height: 50.h,
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4.30,
                  ),
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      itemModel: foodItems[index],
                      onTap: () {
                        navigateTo(
                          context,
                          routeName: Routes.detailsScreen,
                          arguments: ItemDetailsArguments(
                            itemModel: foodItems[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
