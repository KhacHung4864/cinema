// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_cinema_app/widgets/item_ticket_booked.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MovieProvider>(context, listen: false).getListTicketBook(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listMovie = Provider.of<MovieProvider>(context);
    return Container(
      decoration: AppBackGroundTheme.searchTheme,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: const EdgeInsets.only(left: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  "Your ticket",
                  style: AppFonts.poppins700(20, const Color(0xffffffff)).copyWith(height: 22 / 16),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              listMovie.listTicketBooked.isNotEmpty
                  ? Expanded(
                      child: ListView(
                          children: listMovie.listTicketBooked
                              .map(
                                (e) => GestureDetector(
                                  onTap: () async {
                                    AppFunction.showLoading(context);
                                    await Provider.of<MovieProvider>(context, listen: false).getFilmDetail(context, e.filmId, check: false);
                                    await Provider.of<MovieProvider>(context, listen: false).getListSeat(context, e.scheduleId, e.showTime, check: false);
                                    AppFunction.hideLoading(context);
                                    await Navigator.pushNamed(context, AppRoutes.seatScreen, arguments: [e.scheduleId, e.showTime]);
                                    Provider.of<MovieProvider>(context, listen: false).getListTicketBook(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: ItemTicketBooked(
                                        place: e.scheduleInfo?.theaterStr ?? '',
                                        seated: e.seat,
                                        price: e.price,
                                        showTime: e.showTime,
                                        movie: e.filmInfo!.thumbnail ?? "",
                                        name: e.filmInfo!.name ?? "",
                                        time: DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(e.filmInfo?.startTime ?? 0000000)),
                                        category: e.filmInfo!.category!.map((e) => e).toString()),
                                  ),
                                ),
                              )
                              .toList()),
                    )
                  : const Center(
                      child: Text(
                        "Not results found",
                        style: TextStyle(color: AppTheme.white),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
