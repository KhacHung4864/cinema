import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.titleButton, this.onTap, this.flex = 1});

  final String titleButton;
  final void Function()? onTap;
  final double? flex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: flex! * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.w),
          gradient: AppTheme.purpleGradient,
          border:
              GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              titleButton,
              textAlign: TextAlign.center,
              style: AppFonts.poppins500(18.sp, AppTheme.colorTextBtn),
            ),
          ),
        ),
      ),
    );
  }
}
