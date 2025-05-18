extension OnNumber on num {
  String get getDoubleOrInt {
    if (toString().split('.').length > 1) {
      if (int.parse(toString().split('.').elementAt(1)) > 0) {
        return toDouble().toStringAsFixed(2);
      } else {
        return toInt().toString();
      }
    } else {
      return toInt().toString();
    }
  }

  bool get isInteger {
    if (toString().split('.').length > 1) {
      if (int.parse(toString().split('.').elementAt(1)) > 0) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
