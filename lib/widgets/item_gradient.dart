import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ItemGradient extends StatelessWidget {
  const ItemGradient({super.key, required this.icon, this.onTap});

  final Function()? onTap;

  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        padding: EdgeInsets.all(13.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            border: GradientBoxBorder(
                width: 1.5.w,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(96, 255, 202, 0.5),
                      Color.fromRGBO(96, 255, 202, 0),
                      Color.fromRGBO(96, 255, 202, 0),
                      Color.fromRGBO(96, 255, 202, 0.5),
                    ],
                    stops: [0.3, 0.55, 0.7, 1],
                    transform: GradientRotation(pi / 4.6)))),
        child: (Image.asset(icon)),
      ),
    );
  }
}
