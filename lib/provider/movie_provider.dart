// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cinema_app/model/booked.dart';
import 'package:flutter_cinema_app/model/detail_movie.dart';
import 'package:flutter_cinema_app/model/movies.dart';
import 'package:flutter_cinema_app/model/schedule.dart';
import 'package:flutter_cinema_app/model/theater_movie.dart';
import 'package:flutter_cinema_app/model/ticket_booked.dart';
import 'package:flutter_cinema_app/model/user_model.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';

enum TypeMovie { romance, comedy, adventure, documentary, action, science, war }

class MovieProvider extends ChangeNotifier {
  List<Movie> listMovies123 = [];
  List<Movie> listMoviesRomance = [];
  List<Movie> listMoviesadventure = [];
  List<Movie> listMoviesComedy = [];
  List<Movie> listMoviesdocument = [];
  List<Movie> listMoviesAction = [];
  List<Movie> listMoviesScience = [];
  List<Movie> listMoviesWar = [];
  List<Movie> listMovieComingSoon = [];
  List<Movie> listMoviesNow = [];
  List<Movie> listMoviesSearch = [];
  List<TicketBookedModel> listTicketBooked = [];

  List<int> listSeat = [];
  DetailMovie detail = DetailMovie();
  BookedModel booked = BookedModel();
  List<ScheduleModel> listSchedule = [];
  List<DataTheater> listTheater = [];

  UserModel user = UserModel();
  UserModel userUpdate = UserModel();
  String urlImage = "";
  String emailForgot = "";
  String tokenOTP = "";

  Future getListMovie(BuildContext context) async {
    listMovies123 = [];
    listMoviesSearch = [];
    Response? response = await ApiRequest.litsMovie();
    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          listMovies123.add(Movie.fromJson(e));
          listMoviesSearch.add(Movie.fromJson(e));
        }
      }

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }

  Future getListRomanceMovie(BuildContext context, String url, TypeMovie typeMovie) async {
    if (typeMovie == TypeMovie.romance) {
      listMoviesRomance.clear();
    }
    if (typeMovie == TypeMovie.adventure) {
      listMoviesadventure.clear();
    }
    if (typeMovie == TypeMovie.comedy) {
      listMoviesComedy.clear();
    }
    if (typeMovie == TypeMovie.documentary) {
      listMoviesdocument.clear();
    }
    if (typeMovie == TypeMovie.action) {
      listMoviesAction.clear();
    }
    if (typeMovie == TypeMovie.science) {
      listMoviesScience.clear();
    }
    if (typeMovie == TypeMovie.war) {
      listMoviesWar.clear();
    }

    Response? response = await ApiRequest.litsCategoryMovie(url);
    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          if (typeMovie == TypeMovie.romance) {
            listMoviesRomance.add(Movie.fromJson(e));
          }
          if (typeMovie == TypeMovie.adventure) {
            listMoviesadventure.add(Movie.fromJson(e));
          }
          if (typeMovie == TypeMovie.comedy) {
            listMoviesComedy.add(Movie.fromJson(e));
          }
          if (typeMovie == TypeMovie.documentary) {
            listMoviesdocument.add(Movie.fromJson(e));
          }
          if (typeMovie == TypeMovie.action) {
            listMoviesAction.add(Movie.fromJson(e));
          }
          if (typeMovie == TypeMovie.science) {
            listMoviesScience.add(Movie.fromJson(e));
          }
          if (typeMovie == TypeMovie.war) {
            listMoviesWar.add(Movie.fromJson(e));
          }
        }
      }

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }

  Future getListStatusMovie(BuildContext context, String url, bool typeMovie) async {
    if (typeMovie) {
      listMovieComingSoon.clear();
    } else {
      listMoviesNow.clear();
    }
    Response? response = await ApiRequest.litsStatusMovie(url);
    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          if (typeMovie) {
            listMovieComingSoon.add(Movie.fromJson(e));
          } else {
            listMoviesNow.add(Movie.fromJson(e));
          }
        }
      }

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }

  Future getUserInfor(BuildContext context) async {
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.getUser(user.id);
    user = UserModel.fromJson(response.data);
    AppFunction.hideLoading(context);
    notifyListeners();
  }

  Future getUserInforByToken(BuildContext context) async {
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.getUserByToken();
    user = UserModel.fromJson(response.data['userInfo']);
    AppFunction.hideLoading(context);
    notifyListeners();
  }

  Future getFilmDetail(BuildContext context, String? id, {bool check = true}) async {
    listTheater = [];
    if (check) AppFunction.showLoading(context);
    Response? response = await ApiRequest.getFilmDetail(id);
    if (response.data['status'] == 0) {
      detail = DetailMovie.fromJson(response.data["data"]);
    }
    Response? res = await ApiRequest.calllistTheater();
    if (res.data['status'] == 0) {
      if (res.data['data'].length > 0) {
        for (var e in res.data['data']) {
          listTheater.add(DataTheater.fromJson(e));
        }
      }
    }
    if (check) AppFunction.hideLoading(context);
    notifyListeners();
  }

  Future getListSchedule(BuildContext context, String? id, int? idTheater) async {
    listSchedule = [];
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.callListSchedule(id, idTheater);
    AppFunction.hideLoading(context);

    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          listSchedule.add(ScheduleModel.fromJson(e));
        }
      }

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }

  Future getListTicketBook(BuildContext context) async {
    listTicketBooked = [];
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.callListTicketBooked(user.id);
    AppFunction.hideLoading(context);

    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          listTicketBooked.add(TicketBookedModel.fromJson(e));
        }
      }

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }

  Future getListSeat(BuildContext context, String? schedule, String? showtime, {bool check = true}) async {
    listSeat = [];
    if (check) AppFunction.showLoading(context);
    Response? response = await ApiRequest.callListSeat(schedule, showtime);
    if (check) AppFunction.hideLoading(context);

    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          listSeat.add(e);
        }
      }

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }

  Future uploadImage(BuildContext context, String image) async {
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.updateImage(image);
    urlImage = response.data;
    AppFunction.hideLoading(context);
    notifyListeners();
  }

  Future uploadSeats(BuildContext context, List<int> seated, String? idSchedule, String? showtime, int? price) async {
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.bookSeats(
      userId: user.id!,
      filmId: detail.sId,
      scheduleId: idSchedule,
      seat: seated,
      showTime: showtime,
      price: price,
    );
    if (response.data['status'] == -1) {
      booked = BookedModel();
    } else {
      booked = BookedModel.fromJson(response.data['data']);
    }
    await getListSeat(context, idSchedule, showtime, check: false);
    AppFunction.hideLoading(context);
    notifyListeners();
  }

  Future searchMoive(BuildContext context, String url) async {
    listMoviesSearch = [];
    listMovies123 = [];
    AppFunction.showLoading(context);
    Response? response = await ApiRequest.searchMovie(url);
    if (response.data['status'] == 0) {
      if (response.data['data'].length > 0) {
        for (var e in response.data['data']) {
          listMoviesSearch.add(Movie.fromJson(e));

          listMovies123.add(Movie.fromJson(e));
        }
      }
      AppFunction.hideLoading(context);
      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      // AppFunction.showAppDialog(context,
      //     title: "Lỗi",
      //     content: response.data["message"] ??
      //         "Có lỗi bất ngờ xảy ra , vui lòng thử lại");
    }
    notifyListeners();
  }
}
