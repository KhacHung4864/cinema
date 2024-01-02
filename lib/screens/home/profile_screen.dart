// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/provider.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime? selectedDateTime;

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController numberPhoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MovieProvider>(context, listen: false).getUserInfor(context);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    var data = Provider.of<MovieProvider>(context).user;
    Provider.of<User>(context, listen: false).checkImage(data.avatar ?? "");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context);
    return Consumer2<User, LanguageProvider>(builder: (context, userData, languageProvider, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).profile,
                            // textAlign: TextAlign.center,
                            style: AppFonts.poppins700(20.sp, AppTheme.white)),
                      ],
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Stack(children: [
                      userData.avatar,
                    ]),
                    Column(
                      children: [
                        Text(data.user.name ?? "name",
                            // textAlign: TextAlign.center,
                            style: AppFonts.poppins700(20.sp, AppTheme.white)),
                        Text(data.user.email ?? "email",
                            // textAlign: TextAlign.center,
                            style: AppFonts.poppins500(18.sp, AppTheme.white)),
                      ],
                    ),
                    SizedBox(
                      height: 30.w,
                    ),
                    InkWell(
                      onTap: () async {
                        final check = await Navigator.pushNamed(context, AppRoutes.edit);
                        if (check == true) {
                          Provider.of<MovieProvider>(context, listen: false).getUserInfor(context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w),
                          color: const Color(0xffFFFFFF).withOpacity(0.06),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset(
                                AppImages.userInfor,
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text("Chỉnh sửa thông tin",
                                // textAlign: TextAlign.center,
                                style: AppFonts.poppins500(18.sp, AppTheme.white)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        border: GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w),
                        color: const Color(0xffFFFFFF).withOpacity(0.06),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Image.asset(
                              AppImages.userNotifi,
                              width: 40.w,
                              height: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Text("Thông báo",
                              // textAlign: TextAlign.center,
                              style: AppFonts.poppins500(18.sp, AppTheme.white)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.setting);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w),
                          color: const Color(0xffFFFFFF).withOpacity(0.06),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset(
                                AppImages.userSetting,
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text("Cài đặt",
                                // textAlign: TextAlign.center,
                                style: AppFonts.poppins500(18.sp, AppTheme.white)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final check = await Navigator.pushNamed(context, AppRoutes.changePassword);
                        if (check == true) {
                          Provider.of<MovieProvider>(context, listen: false).getUserInfor(context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w),
                          color: const Color(0xffFFFFFF).withOpacity(0.06),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Image.asset(
                                AppImages.userHelp,
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text("Đổi mật khẩu",
                                // textAlign: TextAlign.center,
                                style: AppFonts.poppins500(18.sp, AppTheme.white)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showMyDialog(
                          context,
                          title: "Thông báo",
                          content: "Bạn có muốn đăng xuất không",
                          noButton: false,
                          buttonOneText: "Đăng xuất",
                          buttonTwoText: "Không",
                          onPressButtonOne: () async {
                            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginScreen, (route) => false);
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString("token", '');
                          },
                          onPressButtonTwo: () async {},
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w),
                          color: const Color(0xffFFFFFF).withOpacity(0.06),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.userLogout,
                              width: 20.w,
                              height: 20.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 10.w),
                            Text("Đăng xuất",
                                // textAlign: TextAlign.center,
                                style: AppFonts.poppins500(18.sp, AppTheme.white)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 46.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
