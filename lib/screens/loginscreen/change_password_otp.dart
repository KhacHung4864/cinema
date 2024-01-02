// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_textfield.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChangePasswordOTP extends StatefulWidget {
  const ChangePasswordOTP({Key? key}) : super(key: key);

  @override
  State<ChangePasswordOTP> createState() => _ChangePasswordOTPState();
}

class _ChangePasswordOTPState extends State<ChangePasswordOTP> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isError = false;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff130B2B),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: const AssetImage(AppImages.buttonBack),
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(S.of(context).createNewPassword,
                      // textAlign: TextAlign.center,
                      style: AppFonts.poppins700(20.sp, AppTheme.white)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40.w, bottom: 15.w),
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.appLogo,
                  width: 162.w,
                  height: 143.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5.w),
              Container(
                margin: EdgeInsets.only(top: 10.w),
                child: AppTextField(
                    controller: newPasswordController,
                    hintText: 'Newpassword',
                    icon: AppImages.iconPassword,
                    isIcon: true,
                    isPassword: true),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.w),
                child: AppTextField(
                  controller: confirmPasswordController,
                  hintText: 'ConfirmPassword',
                  icon: AppImages.iconPassword,
                  isIcon: true,
                  isPassword: true,
                ),
              ),
              isError == false
                  ? SizedBox(
                      height: 20.w,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.w),
                          child: Text(
                            "mật khẩu không khớp!",
                            style:
                                TextStyle(color: Colors.red, fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 20.w),
              AppButton(
                titleButton: S.of(context).Continue,
                onTap: () async {
                  AppFunction.hideKeyboard(context);

                  if (newPasswordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    showMyDialog(
                      context,
                      title: "Thông báo",
                      content: "Bạn vui lòng không để trống mật khẩu ",
                      noButton: false,
                    );
                  } else {
                    if (confirmPasswordController.text !=
                        newPasswordController.text) {
                      setState(() {
                        isError = true;
                      });
                    } else {
                      setState(() {
                        isError = false;
                      });
                      AppFunction.showLoading(context);
                      Response res = await ApiRequest.changePasswordOTP(
                          newPassword: newPasswordController.text,
                          email: data.emailForgot,
                          tokenOTP: data.tokenOTP);
                      if (res.data["status"] == 0) {
                        AppFunction.hideLoading(context);
                        showMyDialog(context,
                            title: "Thông báo",
                            content: "Đổi mật khẩu thành công",
                            noButton: false,
                            buttonOneText: "Xác nhận", onPressButtonOne: () {
                          Navigator.pop(context, true);
                        });
                      }
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
