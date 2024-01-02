import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingProvider extends ChangeNotifier {
  bool isLoading = false;
  void showLoading() {
    isLoading = true;
    EasyLoading.show(status: "Đang tải...");
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    EasyLoading.dismiss();
    notifyListeners();
  }

  static void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
