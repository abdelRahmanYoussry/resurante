import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:resturente/core/utils/shared/app/assets_manager.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';
import 'package:resturente/core/utils/shared/translations/locale_keys.g.dart';
import 'package:resturente/core/utils/shared/widgets/elevatedButton.dart';

import '../app/font_manager.dart';
import '../app/values_manager.dart';

class NoInternetConnection extends StatefulWidget {
  final Widget connectionWidget;

  const NoInternetConnection({super.key, required this.connectionWidget});

  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  final ValueNotifier<bool> isDeviceConnected = ValueNotifier<bool>(true);
  late StreamSubscription<InternetConnectionStatus> subscription;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  Future<void> checkConnection() async {
    isDeviceConnected.value = await InternetConnectionChecker().hasConnection;
    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      isDeviceConnected.value = (status == InternetConnectionStatus.connected);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    isDeviceConnected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDeviceConnected,
      builder: (context, isConnected, child) {
        return isConnected ? widget.connectionWidget : const NoInternetScreen();
      },
    );
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  Future<void> checkInternet(ValueNotifier<bool> notifier) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        notifier.value = true;
      }
    } on SocketException catch (_) {
      notifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> internetNotifier = ValueNotifier<bool>(false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.noInternetImage,
            ),
            const SizedBox(height: 20),
            Text(
              LocaleKeys.noInternetConnection.tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(LocaleKeys.thereIsError.tr(),
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: internetNotifier,
              builder: (context, isConnected, child) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MyElevatedButton(
                    width: double.infinity,
                    borderWidth: AppSize.size2,
                    radius: AppSize.size10,
                    fontSize: FontSize.size18,
                    onTap: () => checkInternet(internetNotifier),
                    buttonName: LocaleKeys.retry.tr(),
                    borderColor: ColorManager.mainPrimaryColor4,
                    buttonColor: ColorManager.mainPrimaryColor4,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
