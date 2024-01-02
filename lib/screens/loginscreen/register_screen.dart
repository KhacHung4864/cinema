// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_textfield.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_gradient.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, userData, child) {
      return Scaffold(
        backgroundColor: const Color(0xff130B2B),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.all(25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const AppBackButton(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.w),
                    alignment: Alignment.center,
                    child: (Image.asset(
                      AppImages.appLogo,
                      width: 162.w,
                      height: 143.w,
                      fit: BoxFit.contain,
                    )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: (Text(
                      S.of(context).createAccount,
                      style: TextStyle(fontSize: 28.sp, color: Colors.white),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.w),
                    child: AppTextField(
                      controller: emailController,
                      hintText: "Email",
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
                                "Tên tài khoản không hợp lệ. Vui lòng nhập lại!",
                                style: TextStyle(color: Colors.red, fontSize: 13.sp),
                              ),
                            ),
                          ],
                        ),
                  AppTextField(
                    controller: passwordController,
                    hintText: "Password",
                    icon: AppImages.iconPassword,
                    isPassword: true,
                    isIcon: true,
                  ), // PassWord
                  SizedBox(
                    height: 30.h,
                  ),
                  AppButton(
                    onTap: () async {
                      AppFunction.hideKeyboard(context);
                      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                        setState(() {
                          isError = false;
                        });
                        showMyDialog(
                          context,
                          title: "Thông báo",
                          content: "Bạn vui lòng không để trống mật khẩu hoặc số điện thoại",
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
                          Response res = await ApiRequest.userLogin(passwordController.text.trim(), emailController.text.trim(), "register");
                          if (res.data["loginCode"] == 0) {
                            String? token = res.data["token"];
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString("token", token!);
                            Navigator.pushNamed(context, AppRoutes.chooseLocation);
                            AppFunction.hideLoading(context);
                          } else if (res.data["loginCode"] == 7) {
                            AppFunction.hideLoading(context);
                            showMyDialog(
                              context,
                              title: "Thông báo",
                              content: "Email đã tồn tại",
                              noButton: true,
                            );
                          } else {
                            AppFunction.hideLoading(context);
                            showMyDialog(
                              context,
                              title: "Thông báo",
                              content: res.data['message'] ?? "Cố lỗi xảy ra",
                              noButton: true,
                            );
                          }
                        }
                      }
                    },
                    titleButton: S.of(context).signup,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 22.w),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: AppTheme.pinkOther,
                          height: 1.5.w,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            S.of(context).orcontinue,
                            style: AppFonts.poppins500(14.sp, AppTheme.white),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: AppTheme.pinkOther,
                          height: 1.5.w,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: 56,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ItemGradient(icon: AppImages.iconFacebook),
                          ),
                          Expanded(
                            flex: 1,
                            child: ItemGradient(icon: AppImages.iconGoogle),
                          ),
                          Expanded(
                            flex: 1,
                            child: ItemGradient(
                              icon: AppImages.iconApple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width * 0.9,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).already,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginScreen, (route) => false);
                          },
                          child: Container(
                            child: (Text(
                              S.of(context).signin,
                              style: const TextStyle(color: Color(0xffDF1893), fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
