import 'dart:async';

class Debouncer {
  Timer? timer;

  /// run a function once and ignore any other calls made in [millis]'s duration
  Future run(Function() action, int millis) async {
    if (timer?.isActive != true) {
      action();
      timer?.cancel();
      timer = Timer(Duration(milliseconds: millis), () => timer?.cancel());
    }
  }

  /// wait for [millis] to pass then run a function
  runLazy(Function() action, int millis) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: millis), () => action());
  }

  dispose() {
    timer?.cancel();
  }
}
