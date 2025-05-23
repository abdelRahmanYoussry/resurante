import 'package:flutter/material.dart';


import '../app/color_manager.dart';
import '../app/values_manager.dart';
import '../components/components.dart';

class MainViewContainer extends StatelessWidget {
  const MainViewContainer({
    Key? key,
    required this.mainWidget,
    required this.appBarHeight,
    required this.cardHeight,
    this.position,
    this.titleWidget,
    required this.cardWidth,
  }) : super(key: key);
  final Widget mainWidget;
  final double appBarHeight;
  final double cardHeight;
  final double cardWidth;
  final double? position;
  final Widget? titleWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myMediaQuery(context: context).height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.only(top: AppPadding.padding50),
              decoration: BoxDecoration(
                color: ColorManager.mainPrimaryColor4,
                // image: DecorationImage(
                //   image: AssetImage(
                //     ImageAssets.appBackGroundImage,
                //   ),
                //   fit: BoxFit.cover,
                // ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.size20),
                  bottomRight: Radius.circular(AppSize.size20),
                ),
              ),
              child: titleWidget != null ? titleWidget! : const SizedBox(),
            ),
          ),
          Positioned(
            top: position,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - cardHeight,
              width: MediaQuery.of(context).size.width - cardWidth,
              child: Card(
                elevation: 10,
                borderOnForeground: true,
                shadowColor: Theme.of(context).textTheme.headlineMedium!.color!,
                semanticContainer: true,
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.size30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.padding10,
                    left: AppPadding.padding20,
                    right: AppPadding.padding20,
                    bottom: AppPadding.padding5,
                  ),
                  child: mainWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
