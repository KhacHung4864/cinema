import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/widgets/item_instrest.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppTheme.blackBackground,
          image: DecorationImage(
              image: AssetImage(AppImages.layer1), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 37.w,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(S.of(context).chooseyourLocations,
                    // textAlign: TextAlign.center,
                    style: AppFonts.poppins500(22.w, AppTheme.white)),
              ),
              Container(
                padding: EdgeInsets.all(25.w),
                child: Text(S.of(context).chooseYouLocation,
                    style: AppFonts.poppins500(16.sp, AppTheme.white)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 30.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).chooseLocation,
                        style: AppFonts.poppins500(18.sp, AppTheme.white)
                            .copyWith(height: 27 / 18),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Row(
                        children: [
                          const ItemInstrest(title: 'Hà Nội'),
                          SizedBox(
                            width: 15.w,
                          ),
                          const ItemInstrest(title: 'Hồ Chí Minh'),
                        ],
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                      Row(
                        children: [
                          const ItemInstrest(title: 'Bình Dương'),
                          SizedBox(
                            width: 15.w,
                          ),
                          const ItemInstrest(title: 'Thái Bình'),
                        ],
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                      Row(
                        children: [
                          const ItemInstrest(title: 'Thanh Hóa'),
                          SizedBox(
                            width: 15.w,
                          ),
                          const ItemInstrest(title: 'Nghệ An'),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        S.of(context).chooseLanguage,
                        style: AppFonts.poppins500(18.sp, AppTheme.white)
                            .copyWith(height: 27 / 18),
                      ),
                      SizedBox(
                        height: 22.w,
                      ),
                      Row(
                        children: [
                          ItemInstrest(
                            title: S.of(context).eng,
                            isButtonEng: true,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          ItemInstrest(
                            title: S.of(context).vie,
                            isButtonVie: true,
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: 44.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 28.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.profileSetup);
                        },
                        child: AppButton(
                          titleButton: S.of(context).Continue,
                          flex: 0.5,
                        )),
                    SizedBox(
                      width: 44.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 42.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
