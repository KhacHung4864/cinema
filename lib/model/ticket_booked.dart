// ignore_for_file: no_leading_underscores_for_local_identifiers

class TicketBookedModel {
  String? id;
  String? roomId;
  String? userId;
  UserInfo? userInfo;
  String? filmId;
  FilmInfo? filmInfo;
  String? scheduleId;
  ScheduleInfo? scheduleInfo;
  List<int>? seat;
  String? showTime;
  int? showDate;
  int? price;
  bool? paid;
  int? createdAt;

  TicketBookedModel(
      {this.id,
      this.roomId,
      this.userId,
      this.userInfo,
      this.filmId,
      this.filmInfo,
      this.scheduleId,
      this.scheduleInfo,
      this.seat,
      this.showTime,
      this.showDate,
      this.price,
      this.paid,
      this.createdAt});

  TicketBookedModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    roomId = json["roomId"];
    userId = json["userId"];
    userInfo = json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]);
    filmId = json["filmId"];
    filmInfo = json["filmInfo"] == null ? null : FilmInfo.fromJson(json["filmInfo"]);
    scheduleId = json["scheduleId"];
    scheduleInfo = json["scheduleInfo"] == null ? null : ScheduleInfo.fromJson(json["scheduleInfo"]);
    seat = json["seat"] == null ? null : List<int>.from(json["seat"]);
    showTime = json["showTime"];
    showDate = json["showDate"];
    price = json["price"];
    paid = json["paid"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["roomId"] = roomId;
    _data["userId"] = userId;
    if (userInfo != null) {
      _data["userInfo"] = userInfo?.toJson();
    }
    _data["filmId"] = filmId;
    if (filmInfo != null) {
      _data["filmInfo"] = filmInfo?.toJson();
    }
    _data["scheduleId"] = scheduleId;
    if (scheduleInfo != null) {
      _data["scheduleInfo"] = scheduleInfo?.toJson();
    }
    if (seat != null) {
      _data["seat"] = seat;
    }
    _data["showTime"] = showTime;
    _data["showDate"] = showDate;
    _data["price"] = price;
    _data["paid"] = paid;
    _data["createdAt"] = createdAt;
    return _data;
  }
}

class ScheduleInfo {
  String? id;
  String? filmId;
  String? romId;
  List<String>? showTime;
  int? showDate;
  int? startTime;
  int? endTime;
  int? nSeat;
  int? createdAt;
  int? roomNum;
  int? theater;
  String? theaterStr;

  ScheduleInfo({this.id, this.filmId, this.romId, this.showTime, this.showDate, this.startTime, this.endTime, this.nSeat, this.createdAt, this.roomNum, this.theater, this.theaterStr});

  ScheduleInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    filmId = json["filmId"];
    romId = json["romId"];
    showTime = json["showTime"] == null ? null : List<String>.from(json["showTime"]);
    showDate = json["showDate"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    nSeat = json["nSeat"];
    createdAt = json["createdAt"];
    roomNum = json["roomNum"];
    theater = json["theater"];
    theaterStr = json["theaterStr"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["filmId"] = filmId;
    _data["romId"] = romId;
    if (showTime != null) {
      _data["showTime"] = showTime;
    }
    _data["showDate"] = showDate;
    _data["startTime"] = startTime;
    _data["endTime"] = endTime;
    _data["nSeat"] = nSeat;
    _data["createdAt"] = createdAt;
    _data["roomNum"] = roomNum;
    _data["theater"] = theater;
    _data["theaterStr"] = theaterStr;
    return _data;
  }
}

class FilmInfo {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? content;
  String? videoUrl;
  String? thumbnail;
  List<String>? category;
  List<String>? director;
  List<String>? actor;
  String? language;
  int? startTime;
  int? runningTime;
  int? endTime;
  int? heartTotal;
  int? status;
  List<dynamic>? schedule;

  FilmInfo(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.content,
      this.videoUrl,
      this.thumbnail,
      this.category,
      this.director,
      this.actor,
      this.language,
      this.startTime,
      this.runningTime,
      this.endTime,
      this.heartTotal,
      this.status,
      this.schedule});

  FilmInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    slug = json["slug"];
    description = json["description"];
    content = json["content"];
    videoUrl = json["videoUrl"];
    thumbnail = json["thumbnail"];
    category = json["category"] == null ? null : List<String>.from(json["category"]);
    director = json["director"] == null ? null : List<String>.from(json["director"]);
    actor = json["actor"] == null ? null : List<String>.from(json["actor"]);
    language = json["language"];
    startTime = json["startTime"];
    runningTime = json["runningTime"];
    endTime = json["endTime"];
    heartTotal = json["heartTotal"];
    status = json["status"];
    schedule = json["schedule"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["description"] = description;
    _data["content"] = content;
    _data["videoUrl"] = videoUrl;
    _data["thumbnail"] = thumbnail;
    if (category != null) {
      _data["category"] = category;
    }
    if (director != null) {
      _data["director"] = director;
    }
    if (actor != null) {
      _data["actor"] = actor;
    }
    _data["language"] = language;
    _data["startTime"] = startTime;
    _data["runningTime"] = runningTime;
    _data["endTime"] = endTime;
    _data["heartTotal"] = heartTotal;
    _data["status"] = status;
    if (schedule != null) {
      _data["schedule"] = schedule;
    }
    return _data;
  }
}

class UserInfo {
  String? id;
  String? name;
  String? avatar;
  int? loginCode;
  String? email;
  String? phoneNumber;
  String? password;
  String? address;
  String? googleId;
  String? birth;
  int? gender;
  int? registerDate;
  String? token;
  int? lastLogin;
  int? status;
  int? userRole;
  int? passwordChangeAt;
  String? passwordResetToken;
  int? passwordResetExpires;

  UserInfo(
      {this.id,
      this.name,
      this.avatar,
      this.loginCode,
      this.email,
      this.phoneNumber,
      this.password,
      this.address,
      this.googleId,
      this.birth,
      this.gender,
      this.registerDate,
      this.token,
      this.lastLogin,
      this.status,
      this.userRole,
      this.passwordChangeAt,
      this.passwordResetToken,
      this.passwordResetExpires});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    avatar = json["avatar"];
    loginCode = json["loginCode"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    password = json["password"];
    address = json["address"];
    googleId = json["googleId"];
    birth = json["birth"];
    gender = json["gender"];
    registerDate = json["registerDate"];
    token = json["token"];
    lastLogin = json["lastLogin"];
    status = json["status"];
    userRole = json["userRole"];
    passwordChangeAt = json["passwordChangeAt"];
    passwordResetToken = json["passwordResetToken"];
    passwordResetExpires = json["passwordResetExpires"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["avatar"] = avatar;
    _data["loginCode"] = loginCode;
    _data["email"] = email;
    _data["phoneNumber"] = phoneNumber;
    _data["password"] = password;
    _data["address"] = address;
    _data["googleId"] = googleId;
    _data["birth"] = birth;
    _data["gender"] = gender;
    _data["registerDate"] = registerDate;
    _data["token"] = token;
    _data["lastLogin"] = lastLogin;
    _data["status"] = status;
    _data["userRole"] = userRole;
    _data["passwordChangeAt"] = passwordChangeAt;
    _data["passwordResetToken"] = passwordResetToken;
    _data["passwordResetExpires"] = passwordResetExpires;
    return _data;
  }
}
