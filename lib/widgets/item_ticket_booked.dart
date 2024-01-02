import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ItemTicketBooked extends StatelessWidget {
  const ItemTicketBooked({super.key, required this.movie, required this.name, required this.time, required this.category, required this.seated, this.showTime, required this.price});

  final String movie;
  final String name;
  final String time;
  final String category;
  final List<int>? seated;
  final String? showTime;
  final int? price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(color: const Color(0xff111928), borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 150.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: NetworkImage(
                movie,
              ),
              height: double.infinity,
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
                Expanded(
                  child: Text(
                    name.toUpperCase(),
                    style: AppFonts.poppins600(12.sp, AppTheme.white),
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          showTime ?? "12:00",
                          style: AppFonts.poppins500(10.sp, AppTheme.white),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          time,
                          style: AppFonts.poppins500(10.sp, AppTheme.white),
                        ),
                      ],
                    ),
                    Text(
                      category.toUpperCase(),
                      style: AppFonts.poppins500(10.sp, AppTheme.white),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(50.w), gradient: AppTheme.purpleGradient, border: GradientBoxBorder(gradient: AppTheme.borderGradient, width: 2.w)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  '$price  VND',
                                  style: AppFonts.poppins500(14, Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Seat ${seated!.join(', ')}',
                                  style: AppFonts.poppins500(14, Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
