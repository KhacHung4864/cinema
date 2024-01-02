import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class ItemInstrest extends StatefulWidget {
  const ItemInstrest(
      {super.key, required this.title, this.isButtonEng, this.isButtonVie});

  final String title;
  final bool? isButtonEng;
  final bool? isButtonVie;
  @override
  State<ItemInstrest> createState() => _ItemInstrestState();
}

class _ItemInstrestState extends State<ItemInstrest> {
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, language, child) {
      return InkWell(
        onTap: () {
          if (widget.isButtonEng == true) {
            language.setLocale(const Locale('en'));
          } else if (widget.isButtonVie == true) {
            language.setLocale(const Locale('vi'));
          }
          setState(() {
            _isActive = !_isActive;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: AppTheme.blackGradient,
              border: GradientBoxBorder(
                  gradient: _isActive
                      ? AppTheme.pinkGradient3
                      : AppTheme.greenGradient3,
                  width: 2),
              borderRadius: BorderRadius.circular(20.w)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 20.w),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppFonts.poppins600(16.sp, AppTheme.white),
            ),
          ),
        ),
      );
    });
  }
}
