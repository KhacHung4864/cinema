import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/provider/book_ticket.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/screens/ticket/payment_screen.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/seat_state_widget.dart';
import 'package:provider/provider.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key});

  @override
  SeatScreenState createState() => SeatScreenState();
}

class SeatScreenState extends State<SeatScreen> {
  List<int> seated = [];
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String?>;
    var seats = Provider.of<MovieProvider>(context).listSeat;
    var data = Provider.of<MovieProvider>(context);
    return Consumer<BookTicket>(builder: (context, ticket, child) {
      return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.5124, 1.0],
              colors: [Color.fromRGBO(0, 0, 0, 0.92), Color.fromRGBO(44, 19, 92, 1), Color.fromRGBO(17, 7, 35, 1)],
            ),
          ),
          child: Scaffold(
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
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(
                    'Choose seat',
                    style: AppFonts.poppins400(12, Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 35,
                    child: Image.asset(AppImages.imageLine),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 25,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SeatWidget(
                        index: index + 1,
                        isBooked: seats.contains(index + 1),
                        booking: (p0) {
                          if (p0) {
                            seated.add(index + 1);
                          } else {
                            seated.remove(index + 1);
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SeatStateWidget(color: Colors.white, text: 'Chưa đặt'),
                      SeatStateWidget(color: Color(0xFFB6116B), text: 'Đã đặt'),
                      SeatStateWidget(color: Color(0xFF09FBD3), text: 'Đang chọn'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 50,
                      child: AppButton(
                        titleButton: 'Book',
                        onTap: () async {
                          if (seated.isEmpty) {
                            showMyDialog(
                              context,
                              title: 'Thông báo !',
                              content: 'Vui lòng chọn ghế trước khi đặt vé',
                              noButton: false,
                              buttonOneText: 'Xác nhận',
                              onPressButtonOne: () {},
                            );
                          } else {
                            seated.sort();
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                        seated: seated,
                                        idSchedule: args[0],
                                        showTime: args[1],
                                      )),
                            );
                            if (data.booked.price != null) {
                              seated.clear();
                            }
                          }
                        },
                      )),
                ]),
              ),
            ),
          ));
    });
  }
}

class SeatWidget extends StatefulWidget {
  const SeatWidget({
    super.key,
    this.booking,
    this.isBooked = false,
    required this.index,
  });
  final Function(bool)? booking;
  final bool isBooked;
  final int index;
  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  bool isBooking = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isBooked) return;
        setState(() {
          isBooking = !isBooking;
          widget.booking!(isBooking);
        });
      },
      child: Stack(
        children: [
          Container(
            width: 60,
            height: 50,
            margin: const EdgeInsets.all(10),
            child: widget.isBooked ? Image.asset(AppImages.iconBookedSeat) : (isBooking ? Image.asset(AppImages.iconBookingSeat) : Image.asset(AppImages.iconUnbookedSeat)),
          ),
          Center(
              child: Text(
            '${widget.index}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
