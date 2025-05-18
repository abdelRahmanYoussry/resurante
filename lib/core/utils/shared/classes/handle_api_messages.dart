import 'dart:async';

import 'package:flutter/material.dart';

import '../components/components.dart';

Timer? _toastTimer;

void handleApiResponse<T>({
  required BuildContext context,
  required T state,
  required bool Function(T) isSuccess,
  required String successMessage,
  required String Function(T)? getErrorMessage,
  required String Function(T)? getBrokenRuleMessage,
  required VoidCallback? onSuccess,
}) {
  if (isSuccess(state) && successMessage.isNotEmpty) {
    if (_toastTimer != null && _toastTimer!.isActive) {
      return; // Prevent duplicate toasts within the debounce period
    }

    _toastTimer = Timer(const Duration(milliseconds: 500), () {
      showToastNew(
        text: successMessage,
        state: ToastState.success,
        context: context,
      );
      onSuccess?.call();
    });
  } else {
    final brokenRuleMessage = getBrokenRuleMessage?.call(state);
    final errorMessage = getErrorMessage?.call(state);

    if (brokenRuleMessage != null && brokenRuleMessage.isNotEmpty) {
      showToastNew(
        text: brokenRuleMessage,
        state: ToastState.error,
        context: context,
      );
    } else if (errorMessage != null && errorMessage.isNotEmpty) {
      showToastNew(
        text: errorMessage,
        state: ToastState.error,
        context: context,
      );
    }
  }
}
