import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_date.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

List<String> dateBillingual = [S.current.mon, S.current.tue, S.current.wed, S.current.thu, S.current.fri, S.current.sat, S.current.sun];
final Map<String, String> time = {
  '09:00': '',
  '12:00': '',
  '15:00': '',
  '18:00': '',
};

class MovieTime extends StatefulWidget {
  const MovieTime({Key? key}) : super(key: key);

  @override
  State<MovieTime> createState() => _MovieTimeState();
}

class _MovieTimeState extends State<MovieTime> {
  int dateSelectedIndex = -1;
  int timeSelectedIndex = -1;
  String? idSchedule;
  String? showTime;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context).detail;
    var listTime = Provider.of<MovieProvider>(context).listSchedule;
    void handleDateSelection(int index) {
      setState(() {
        dateSelectedIndex = index;
      });
      idSchedule = listTime[index].id;
    }

    void handleTimeSelection(int index) {
      setState(() {
        timeSelectedIndex = index;
      });
      showTime = time.keys.toList()[index];
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(margin: const EdgeInsets.only(left: 15), width: 40, height: 40, child: const AppBackButton()),
        title: Text(
          'PVR Cinema',
          style: AppFonts.poppins700(20, Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(data.thumbnail ?? ""),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: const Color(0xffA4C8FF).withOpacity(0.3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Selected date and time',
                    style: AppFonts.poppins500(20, Colors.white).copyWith(height: 26 / 17),
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: listTime.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ItemDate(
                            isSelected: dateSelectedIndex == index,
                            onTap: () => handleDateSelection(index),
                            day: DateFormat('dd').format(DateTime.fromMillisecondsSinceEpoch(listTime[index].showDate ?? 0000000)),
                            date: DateFormat('MM').format(DateTime.fromMillisecondsSinceEpoch(listTime[index].showDate ?? 0000000)),
                            padding: const EdgeInsets.all(15),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: time.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: ItemDate(
                                isSelected: timeSelectedIndex == index,
                                onTap: () => handleTimeSelection(index),
                                day: time.keys.toList()[index],
                                date: time.values.toList()[index],
                                padding: const EdgeInsets.fromLTRB(13, 8, 13, 4),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                      onTap: () {
                        if (idSchedule == null || showTime == null) {
                          showMyDialog(
                            context,
                            title: 'Thông báo !',
                            content: 'Vui lòng chọn ngày và giờ phim',
                            noButton: false,
                            buttonOneText: 'Xác nhận',
                            onPressButtonOne: () {},
                          );
                          return;
                        }
                        Navigator.pushNamed(context, AppRoutes.seatScreen, arguments: [idSchedule, showTime]);
                        Provider.of<MovieProvider>(context, listen: false).getListSeat(context, idSchedule, showTime);
                      },
                      titleButton: 'Select Seats'),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
