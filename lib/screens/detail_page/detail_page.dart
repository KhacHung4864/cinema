import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_theater.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int theaterSelectedIndex = -1;
  int? idTheater;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context).detail;
    var listTheater = Provider.of<MovieProvider>(context).listTheater;
    void handleDateSelection(int index) {
      setState(() {
        theaterSelectedIndex = index;
      });
      idTheater = listTheater[index].type;
    }

    int star = 4;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    data.name ?? "",
                    style: AppFonts.roboto700(22, Colors.black).copyWith(height: 33 / 22),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          if (i < star)
                            const Icon(Icons.star, color: Colors.yellow, size: 17)
                          else
                            const Icon(
                              Icons.star,
                              color: Color(0xffE0DFE4),
                              size: 17,
                            )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.description ?? "",
                    style: AppFonts.poppins500(16, Colors.white).copyWith(height: 24 / 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: listTheater.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ItemTheater(
                            text: listTheater[index].name ?? '',
                            isSelected: theaterSelectedIndex == index,
                            onTap: () => handleDateSelection(index),
                            padding: const EdgeInsets.all(5),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppButton(
                        onTap: () {
                          if (idTheater == null) {
                            showMyDialog(
                              context,
                              title: 'Thông báo !',
                              content: 'Vui lòng chọn rạp chiếu phim',
                              noButton: false,
                              buttonOneText: 'Xác nhận',
                              onPressButtonOne: () {},
                            );
                            return;
                          }
                          Navigator.pushNamed(
                            context,
                            AppRoutes.movieTime,
                          );
                          Provider.of<MovieProvider>(context, listen: false).getListSchedule(context, data.sId, idTheater);
                        },
                        titleButton: 'Book tickets'),
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
