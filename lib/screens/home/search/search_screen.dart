import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_search.dart';
import 'package:flutter_cinema_app/widgets/item_topsearch.dart';
import 'package:flutter_cinema_app/widgets/key_board_dismiss.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listMovie = Provider.of<MovieProvider>(context);

    return KeyboardDismiss(
      child: Container(
          decoration: AppBackGroundTheme.searchTheme,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                toolbarHeight: 150,
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Column(
                  children: [
                    Text(
                      S.of(context).search,
                      style: AppFonts.poppins700(15, AppTheme.white.withOpacity(0.87)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppSearch(
                      onFieldSubmitted: (value) {
                        Provider.of<MovieProvider>(context, listen: false).searchMoive(context, value);
                      },
                    ),
                  ],
                ),
              ),
              body: listMovie.listMovies123.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      children: listMovie.listMoviesSearch.isEmpty
                          ? listMovie.listMovies123
                              .map((e) => Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, AppRoutes.movieTime, arguments: e.sId);
                                      },
                                      child: ItemTopsearch(
                                          movie: e.thumbnail ?? "",
                                          name: e.name ?? "",
                                          time: DateFormat('dd/MM/yyyy, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(e.startTime ?? 0000000)),
                                          category: e.category!.map((e) => e).toString()),
                                    ),
                                  ))
                              .toList()
                          : listMovie.listMoviesSearch
                              .map((e) => Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.detail,
                                        );
                                        Provider.of<MovieProvider>(context, listen: false).getFilmDetail(context, e.sId);
                                      },
                                      child: ItemTopsearch(
                                          movie: e.thumbnail ?? "",
                                          name: e.name ?? "",
                                          time: DateFormat('dd/MM/yyyy, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(e.startTime ?? 0000000)),
                                          category: e.category!.map((e) => e).toString()),
                                    ),
                                  ))
                              .toList(),
                    )
                  : const Center(
                      child: Text(
                        "Not results found",
                        style: TextStyle(color: AppTheme.white),
                      ),
                    ))),
    );
  }
}
