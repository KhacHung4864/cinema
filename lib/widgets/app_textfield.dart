// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';

class AppTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final String hintText;
  final String? icon;
  final bool isPassword;
  final bool isIcon;
  final TextEditingController? controller;
  final Gradient? gradientGreen;
  final Gradient? gradientPink;

  AppTextField({
    Key? key,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    this.isIcon = true,
    this.controller,
    this.gradientGreen,
    this.gradientPink,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode myFocusNode;
  late bool isObscureText;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    isObscureText = widget.isPassword;
    myFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      isFocused = myFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: const Color(0xffffffff).withOpacity(0.2),
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        style: AppFonts.poppins500(17.sp, AppTheme.white),
        controller: widget.controller,
        obscureText: isObscureText,
        focusNode: myFocusNode,
        decoration: InputDecoration(
          prefixIcon: widget.isIcon
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Image.asset(
                    widget.icon ?? "",
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.contain,
                    color: isFocused ? AppTheme.pink : AppTheme.gray,
                    alignment: Alignment.centerLeft,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: AppFonts.poppins500(17.sp, AppTheme.gray),
          border: GradientOutlineInputBorder(
            width: 1.5.w,
            gradient: AppTheme.inputGradient,
            borderRadius: BorderRadius.circular(20.w),
          ),
          focusedBorder: GradientOutlineInputBorder(
            width: 1.5.w,
            gradient: AppTheme.inputGradientFocus,
            borderRadius: BorderRadius.circular(20.w),
          ),
          contentPadding: EdgeInsets.only(left: 24.w, top: 15.w, bottom: 15.w),
          suffixIcon: widget.isPassword
              ? Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                      color: isFocused ? AppTheme.pink : AppTheme.gray,
                      size: 20.w,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
