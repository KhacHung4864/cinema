import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';
import 'package:flutter_cinema_app/network/apibase/api_client.dart';
import 'package:flutter_cinema_app/network/apibase/api_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRequest {
  // khởi tạo dio
  static const String _domain = "https://cinema-server-wcbv.onrender.com/api";
  static BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    validateStatus: (status) {
      return true;
    },
  );

  // khai bao dio
  static Dio dio = Dio(options);

  // Khởi tạo token
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token ?? "";
  }

  static Future<Response> userLogin(String passWord, String phone, String url) async {
    print('aaaa');
    Map data = {
      "email": phone,
      "password": passWord,
    };
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    var res = dio.post(
      "$_domain/$url",
      data: data,
    );
    return res;
  }

  static Future<Response> litsMovie() async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.get("$_domain/film/get-all-film",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> calllistTheater() async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.get("$_domain/theater/get-theater",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> litsCategoryMovie(String url) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/film/get-film-by-category$url",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> litsStatusMovie(String url) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/film/get-film-by-status$url",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> getFilmDetail(String? url) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/film/get-film-by-id?id=$url",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> callListSchedule(String? url, int? idTheater) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/schedule/get-schedule?filmId=$url&theater=$idTheater",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> callListTicketBooked(String? url) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/ticket/get-all-ticket?userId=$url",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> callListSeat(String? idSchedule, String? showtime) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/ticket/get-seat-of-schedule-by-ticket?scheduleId=$idSchedule&showTime=$showtime",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> searchMovie(String url) async {
    String token = await getToken();
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.get("$_domain/film/search-film?name=$url",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> updateUser({String? name, String? phone, String? address, avatar, dateOfBirth, gender, String? url}) async {
    String token = await getToken();
    Map data = {"name": name, "phoneNumber": phone, "avatar": avatar, "address": address, "birth": dateOfBirth, "gender": gender};
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/$url",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
    return res;
  }

  static Future<Response> getUser(String? id) async {
    String token = await getToken();

    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/user/get-user-by-id?id=$id",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
    return res;
  }

  static Future<Response> getUserByToken() async {
    String token = await getToken();

    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/user/get-user-from-token", data: {"token": token});
    return res;
  }

  static Future<Response> changePassword({
    String? oldPassword,
    String? newPassword,
  }) async {
    String token = await getToken();
    Map data = {"password": oldPassword, "newPassword": newPassword};
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/user/change-password",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
    return res;
  }

  static Future<Response> changePasswordOTP({
    String? email,
    String? newPassword,
    String? tokenOTP,
  }) async {
    String token = await getToken();
    Map data = {"newPassword": newPassword, "email": email, "resetToken": tokenOTP};
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/user/reset-password",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
    return res;
  }

  static Future<Response> forgotPassword({
    String? email,
  }) async {
    String token = await getToken();
    Map data = {"email": email};
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/user/forgot-password",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
    return res;
  }

  static Future<Response> sendOtp({String? email, String? tokenOtp}) async {
    String token = await getToken();
    Map data = {"email": email, "resetToken": tokenOtp};
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/user/check-reset-password",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
    return res;
  }

  static Future<Response> updateImage(String image) async {
    String token = await getToken();
    FormData file = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        image,
      ),
    });
    dio.interceptors.add(PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    var res = dio.post("$_domain/upload",
        data: file,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }

  static Future<Response> bookSeats({required String userId, String? filmId, String? scheduleId, List<int>? seat, String? showTime, int? price}) async {
    String token = await getToken();
    Map data = {
      "userId": userId,
      "filmId": filmId,
      "scheduleId": scheduleId,
      "seat": seat,
      "showTime": showTime,
      "price": price,
    };
    dio.interceptors.add(
      PrettyDioLogger(requestHeader: false, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90),
    );
    var res = dio.post("$_domain/ticket/create-ticket",
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    return res;
  }
}

class ApiRequesst {
  static const String _domain = "https://cinema-server-wcbv.onrender.com/api";

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token ?? "";
  }

  static Future<ApiResponse> userLogin(String passWord, String phone) async {
    Map data = {
      "email": phone,
      "password": passWord,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/login",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> register(String passWord, String email) async {
    Map data = {
      "email": email,
      "password": passWord,
    };

    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/register",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> updateUser(
    String name,
    String userName,
    String phoneNumber,
  ) async {
    Map data = {"name": "hung@gmail.com", "phoneNumber": "0357546106"};
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/user/update-user",
      data: json.encode(data),
    );
  }

  Future<List<Items>?> fetchData() async {
    var dio = Dio();
    Response respone = await dio.get("$_domain/backend/films?perPage=70");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);

    return modelMovies.items;
  }

  Future<List<Items>?> fetchStatusData(String title) async {
    var dio = Dio();
    Response respone = await dio.get("$_domain/backend/films?status=${title.toUpperCase().trim()}&perPage=70");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);

    return modelMovies.items;
  }

  Future<List<Items>?> fetchCategoryData(String title) async {
    var dio = Dio();
    Response respone = await dio.get("$_domain/backend/films?category=${title.toUpperCase().trim()}&perPage=70");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);
    return modelMovies.items;
  }

  Future<List<Items>?> bannerHome() async {
    var dio = Dio();
    Response respone = await dio.get("$_domain/backend/news");
    ModelMovies modelMovies = ModelMovies.fromJson(respone.data);
    return modelMovies.items;
  }
}
