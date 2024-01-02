import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTopsearch extends StatelessWidget {
  const ItemTopsearch({super.key, required this.movie, required this.name, required this.time, required this.category});

  final String movie;
  final String name;
  final String time;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(color: const Color(0xff111928), borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image(
              image: NetworkImage(
                movie,
              ),
              height: 72.w,
              width: 144.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 9.w,
                ),
                Text(
                  name.toUpperCase(),
                  style: AppFonts.poppins600(12.sp, AppTheme.white),
                  overflow: TextOverflow.visible,
                ),
                SizedBox(
                  height: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: AppFonts.poppins500(10.sp, AppTheme.white),
                    ),
                    Text(
                      category.toUpperCase(),
                      style: AppFonts.poppins500(10.sp, AppTheme.white),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
