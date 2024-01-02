// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
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

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final emailController = TextEditingController();
  bool isError = false;

  @override
  void dispose() {
    emailController.dispose();
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
                  Text(S.of(context).forgot,
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
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Email quên mật khẩu ",
                  style: AppFonts.roboto500(28.sp, AppTheme.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 28.w),
                child: AppTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: AppImages.iconEmail,
                  isIcon: true,
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
                            "Email không hợp lệ. Vui lòng nhập lại!",
                            style:
                                TextStyle(color: Colors.red, fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 5.w),
              SizedBox(height: 5.w),
              AppButton(
                titleButton: S.of(context).Continue,
                onTap: () async {
                  AppFunction.hideKeyboard(context);
                  if (emailController.text.isEmpty) {
                    showMyDialog(
                      context,
                      title: "Thông báo",
                      content: "Bạn vui lòng không để trống email",
                      noButton: false,
                    );
                  } else {
                    if (AppFunction.checkEmail(emailController.text.trim())) {
                      setState(() {
                        isError = true;
                      });
                    } else {
                      setState(() {
                        isError = false;
                      });

                      AppFunction.showLoading(context);
                      Response res = await ApiRequest.forgotPassword(
                          email: emailController.text.trim());
                      if (res.data["status"] == "success") {
                        AppFunction.hideLoading(context);
                        data.emailForgot = emailController.text.trim();
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.forgot);
                      } else {
                        AppFunction.hideLoading(context);
                        showMyDialog(
                          context,
                          title: "Thông báo",
                          content: res.statusMessage ?? "",
                          noButton: true,
                        );
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
