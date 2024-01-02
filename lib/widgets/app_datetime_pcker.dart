// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDateTimeButton extends StatefulWidget {
  AppDateTimeButton(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.onDateTimeChanged,
      this.dateTimeByText,
      this.dateTimeText,
      this.checkValue})
      : super(key: key);
  final String icon;
  final String labelText;
  final ValueChanged<DateTime> onDateTimeChanged;
  DateTime? dateTimeText;
  String? dateTimeByText;
  final bool? checkValue;

  @override
  State<AppDateTimeButton> createState() => _AppDateTimeButtonState();
}

class _AppDateTimeButtonState extends State<AppDateTimeButton> {
  String fileName = '';
  bool? isSelect = true;
  Future<void> _showTimePicker() async {
    DateTime pickedTime = await AppFunction.pickTime(
        context, widget.dateTimeText ?? DateTime.now());
    setState(() {
      widget.dateTimeText = pickedTime;
      widget.onDateTimeChanged(pickedTime);
    });
  }

  Future<void> _showDatePicker() async {
    DateTime pickedDate = await AppFunction.pickDate(
        context, widget.dateTimeText ?? DateTime.now());
    setState(() {
      widget.dateTimeText = pickedDate;
      widget.onDateTimeChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.icon == "Calendar") {
          isSelect = false;
          _showDatePicker();
        } else if (widget.icon == "Clock") {
          _showTimePicker();
        }
      },
      child: Container(
        height: 67.w,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.w),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF).withOpacity(0.06),
          border: Border.all(
              color: isSelect == true ? AppTheme.green : AppTheme.pink,
              width: 1.5.w),
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      widget.labelText,
                      style: AppFonts.poppins500(15.sp, AppTheme.white),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      widget.dateTimeByText ??
                          getDateTimeText(widget.icon, widget.dateTimeText),
                      style: AppFonts.poppins500(16.sp, AppTheme.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDateTimeText(String icon, DateTime? dateTime) {
    if (dateTime == null && icon == "Calendar") {
      return 'dd/mm/yy';
    } else if (dateTime == null && icon == "Clock") {
      return 'hh/mm';
    }
    if (icon == "Calendar") {
      return '${dateTime!.day}/${dateTime.month}/${dateTime.year}';
    } else if (icon == "Clock") {
      String amPm = dateTime!.hour < 12 ? 'AM' : 'PM';
      String minute = dateTime.minute.toString().padLeft(2, '0');
      return '${dateTime.hour}:$minute $amPm';
    } else {
      return '';
    }
  }
}
