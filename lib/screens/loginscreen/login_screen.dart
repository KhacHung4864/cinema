// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/model/user_model.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_button_text.dart';
import 'package:flutter_cinema_app/widgets/app_textfield.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_gradient.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;
  bool isError = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff130B2B),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  S.of(context).loginToAccount,
                  style: AppFonts.roboto500(28.sp, AppTheme.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 28.w),
                child: AppTextField(
                  controller: _phoneController,
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
                            "Tên tài khoản không hợp lệ. Vui lòng nhập lại!",
                            style: TextStyle(color: Colors.red, fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
              AppTextField(
                controller: _passwordController,
                hintText: 'Password',
                icon: AppImages.iconPassword,
                isIcon: true,
                isPassword: true,
              ),
              SizedBox(height: 5.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.otpScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(S.of(context).forgot,
                              textAlign: TextAlign.center,
                              style: AppFonts.poppins700(
                                12.sp,
                                AppTheme.pinkText,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.w),
              AppButton(
                titleButton: S.of(context).signin,
                onTap: () async {
                  AppFunction.hideKeyboard(context);

                  if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
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
                    if (AppFunction.checkEmail(_phoneController.text.trim())) {
                      setState(() {
                        isError = true;
                      });
                    } else {
                      setState(() {
                        isError = false;
                      });
                      AppFunction.showLoading(context);
                      var res = await ApiRequest.userLogin(_passwordController.text.trim(), _phoneController.text.trim(), 'login');

                      if (res.data["loginCode"] == 0) {
                        String? token = res.data["token"];
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString("token", token!);
                        data.userUpdate = UserModel.fromJson(res.data["userLogin"]);
                        Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                        AppFunction.hideLoading(context);
                      } else if (res.data["loginCode"] == 2 || res.data["loginCode"] == 3) {
                        AppFunction.hideLoading(context);
                        showMyDialog(
                          context,
                          title: "Thông báo",
                          content: "Thông tin tài khoản hoặc mật khẩu không chính xác",
                          noButton: true,
                        );
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
                margin: EdgeInsets.only(top: 22.w),
                height: 56.w,
                width: 272.w,
                child: const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ItemGradient(
                          icon: AppImages.iconFacebook,
                        )),
                    Expanded(
                        flex: 1,
                        child: ItemGradient(
                          icon: AppImages.iconGoogle,
                        )),
                    Expanded(
                        flex: 1,
                        child: ItemGradient(
                          icon: AppImages.iconApple,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.w),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtonText(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.registerScreen);
                      },
                      text: S.of(context).already,
                      textColor: S.of(context).signup,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
