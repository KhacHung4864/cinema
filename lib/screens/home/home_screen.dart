import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_background_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_cinema_app/widgets/list_movie_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFunction.showLoading(context);
      Future.wait([
        Provider.of<MovieProvider>(context, listen: false).getListMovie(context),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=ROMANCE", TypeMovie.romance),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=ADVENTURE", TypeMovie.adventure),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=COMEDY", TypeMovie.comedy),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=DOCUMENTARY", TypeMovie.documentary),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=ACTION", TypeMovie.action),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=SCIENCE_FICTIONiction", TypeMovie.science),
        Provider.of<MovieProvider>(context, listen: false).getListRomanceMovie(context, "?category=WAR", TypeMovie.war),
        Provider.of<MovieProvider>(context, listen: false).getListStatusMovie(context, "?status=2", true),
        Provider.of<MovieProvider>(context, listen: false).getListStatusMovie(context, "?status=1", false),
      ]).then((results) {
        AppFunction.hideLoading(context);
      }).catchError((error, stackTrace) {});
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
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(left: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      "PVR Cinemas",
                      style: AppFonts.poppins700(16, const Color(0xffffffff)).copyWith(height: 22 / 16),
                    ),
                    const Image(
                      image: AssetImage(AppImages.buttonLocation),
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
              ListMovieWidget(title: " ", listMovie: listMovie.listMovies123, isBanner: true),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).comingSoon, listMovie: listMovie.listMovieComingSoon),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).nowShowing, listMovie: listMovie.listMoviesNow),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).romance, listMovie: listMovie.listMoviesRomance),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).adventure, listMovie: listMovie.listMoviesadventure),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).comedy, listMovie: listMovie.listMoviesComedy),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).documentary, listMovie: listMovie.listMoviesdocument),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).action, listMovie: listMovie.listMoviesAction),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).science, listMovie: listMovie.listMoviesScience),
              const SizedBox(
                height: 17,
              ),
              ListMovieWidget(title: S.of(context).war, listMovie: listMovie.listMoviesWar),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        )),
      ),
    );
  }
}
