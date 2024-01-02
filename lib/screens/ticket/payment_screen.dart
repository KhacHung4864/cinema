// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/provider/book_ticket.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/seat_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/price_detail.dart';
import 'package:flutter_cinema_app/widgets/seat_state_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, this.idSchedule, this.showTime, required this.seated}) : super(key: key);
  final String? idSchedule;
  final String? showTime;
  final List<int> seated;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;
    return Consumer<BookTicket>(builder: (context, ticketInfo, child) {
      var data = Provider.of<MovieProvider>(context);
      int priceSeat = widget.seated.length * 99000;
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 10,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(margin: const EdgeInsets.only(left: 15), width: 40, height: 40, child: const AppBackButton()),
          title: Text(
            'PVR Cinema',
            style: AppFonts.poppins700(20, Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1 / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(0, 0, 0, 0.92), Color.fromRGBO(44, 19, 92, 1), Color.fromRGBO(17, 7, 35, 1)],
                    stops: [
                      0,
                      0.2516,
                      0.8646,
                    ],
                    transform: GradientRotation(180.18 * (3.141592 / 180)), // chuyển đổi độ sang radian
                  ),
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(data.detail.thumbnail ?? ""), opacity: 0.5)),
              child: Consumer<SeatProvider>(
                builder: (context, seat, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height,
                      ),
                      Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Order Summary',
                              style: AppFonts.poppins400(12, Colors.white),
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: Text(
                            data.detail.name ?? "".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: AppFonts.poppins600(16, Colors.white),
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(flex: 1, child: FittedBox(child: SeatStateWidget(image: AppImages.iconClock, text: widget.showTime ?? ""))),
                      const Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: SeatStateWidget(image: AppImages.icon3D, text: 'English 3D'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: SeatStateWidget(image: AppImages.iconCalendar, text: DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(data.booked.createdAt ?? 0000000))),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: SeatStateWidget(image: AppImages.iconSeat, text: '${widget.seated.length} Seats selected'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: SeatStateWidget(image: AppImages.iconTicket, text: 'Seat ${widget.seated.join(', ')}'),
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              height: MediaQuery.of(context).size.height * 1 / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2), image: const DecorationImage(fit: BoxFit.cover, image: AssetImage(AppImages.imagePaymentLinearBg))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                          'Price detail',
                          style: AppFonts.poppins400(12, const Color(0xFFFFFFA6).withOpacity(0.65)),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 12,
                          width: 7,
                          child: Image.asset(AppImages.iconUp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Ticket Subtotal',
                      style: AppFonts.poppins600(15, Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PriceDetail(textOne: '${widget.seated.length} Ticket(s) 99.000 VND/ticket', moneySign: true, price: priceSeat.toString()),
                  ),
                  const Expanded(
                    flex: 1,
                    child: PriceDetail(
                      textOne: 'food & beverages',
                      price: '0',
                      moneySign: true,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: PriceDetail(
                      textOne: 'Parking charges',
                      price: '0',
                      moneySign: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Fee & Tax ',
                      style: AppFonts.poppins600(15, Colors.white),
                    ),
                  ),
                  const Expanded(flex: 1, child: PriceDetail(textOne: 'Booking Charge', price: '0')),
                  const Expanded(
                    flex: 1,
                    child: PriceDetail(textOne: 'Central Goods and Service Tax', price: '0'),
                  ),
                  Expanded(flex: 1, child: PriceDetail(textOne: 'VAT Fee', price: (priceSeat ~/ 10).toString())),
                  Expanded(
                    flex: 2,
                    child: PriceDetail(
                      textOne: 'Total',
                      price: ((priceSeat ~/ 10) + priceSeat).toString(),
                      moneySign: true,
                      isBoldText: true,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 47,
                      child: AppButton(
                        titleButton: 'Thanh toán',
                        onTap: () async {
                          showMyDialog(
                            context,
                            title: 'Thông báo !',
                            content: 'Đặt vé ',
                            noButton: false,
                            buttonOneText: 'Xác nhận',
                            onPressButtonOne: () async {
                              await Provider.of<MovieProvider>(context, listen: false).uploadSeats(context, widget.seated, widget.idSchedule, widget.showTime, (priceSeat ~/ 10) + priceSeat);
                              if (data.booked.price == null) {
                                showMyDialog(
                                  context,
                                  title: 'Thông báo !',
                                  content: 'Đặt vé không thành công, Có ghế đã được chọn',
                                  noButton: false,
                                  buttonOneText: 'Xác nhận',
                                  onPressButtonOne: () {
                                    Navigator.pop(context);
                                  },
                                );
                                return;
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
