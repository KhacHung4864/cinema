import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/provider/show_loading_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AppFunction {
  static showLoading(BuildContext context) async {
    context.read<LoadingProvider>().showLoading();
  }

  static hideLoading(BuildContext context) async {
    context.read<LoadingProvider>().hideLoading();
  }

  static void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static checkEmail(String email) {
    if (!RegExp(r'^.+@gmail\.com$').hasMatch(email)) {
      return true;
    }
    return false;
  }

  static checkPassword(String password) {
    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$_^+,.!%*?&#:;"~ ])[A-Za-z\d@$_^+,.!%*?&#:;"~ ]{8,}$')
        .hasMatch(password)) {
      return true;
    }
    return false;
  }

  static Future<DateTime> pickTime(
      BuildContext context, DateTime dateTimeText) async {
    DateTime? pickedTime = await picker.DatePicker.showTimePicker(context,
        locale: picker.LocaleType.vi,
        showSecondsColumn: false,
        theme: picker.DatePickerTheme(
            cancelStyle: AppFonts.poppins500(18.sp, Colors.red),
            doneStyle: AppFonts.poppins500(18.sp, Colors.red)));
    if (pickedTime != null) {
      return pickedTime;
    } else {
      return dateTimeText;
    }
  }

  //Pick Date
  static Future<DateTime> pickDate(
      BuildContext context, DateTime dateTimeText) async {
    DateTime? pickedTime = await picker.DatePicker.showDatePicker(context,
        locale: picker.LocaleType.vi,
        theme: picker.DatePickerTheme(
          cancelStyle: AppFonts.poppins500(18.sp, Colors.red),
          doneStyle: AppFonts.poppins500(18.sp, Colors.red),
        ));
    if (pickedTime != null) {
      return pickedTime;
    } else {
      return dateTimeText;
    }
  }
}
