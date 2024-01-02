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
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["roomId"] is String) {
      roomId = json["roomId"];
    }
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["userInfo"] is Map) {
      userInfo = json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]);
    }
    if (json["filmId"] is String) {
      filmId = json["filmId"];
    }
    if (json["filmInfo"] is Map) {
      filmInfo = json["filmInfo"] == null ? null : FilmInfo.fromJson(json["filmInfo"]);
    }
    if (json["scheduleId"] is String) {
      scheduleId = json["scheduleId"];
    }
    if (json["scheduleInfo"] is Map) {
      scheduleInfo = json["scheduleInfo"] == null ? null : ScheduleInfo.fromJson(json["scheduleInfo"]);
    }
    if (json["seat"] is List) {
      seat = json["seat"] == null ? null : List<int>.from(json["seat"]);
    }
    if (json["showTime"] is String) {
      showTime = json["showTime"];
    }
    if (json["showDate"] is int) {
      showDate = json["showDate"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["paid"] is bool) {
      paid = json["paid"];
    }
    if (json["createdAt"] is int) {
      createdAt = json["createdAt"];
    }
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

  ScheduleInfo({this.id, this.filmId, this.romId, this.showTime, this.showDate, this.startTime, this.endTime, this.nSeat, this.createdAt});

  ScheduleInfo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["filmId"] is String) {
      filmId = json["filmId"];
    }
    if (json["romId"] is String) {
      romId = json["romId"];
    }
    if (json["showTime"] is List) {
      showTime = json["showTime"] == null ? null : List<String>.from(json["showTime"]);
    }
    if (json["showDate"] is int) {
      showDate = json["showDate"];
    }
    if (json["startTime"] is int) {
      startTime = json["startTime"];
    }
    if (json["endTime"] is int) {
      endTime = json["endTime"];
    }
    if (json["nSeat"] is int) {
      nSeat = json["nSeat"];
    }
    if (json["createdAt"] is int) {
      createdAt = json["createdAt"];
    }
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
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["content"] is String) {
      content = json["content"];
    }
    if (json["videoUrl"] is String) {
      videoUrl = json["videoUrl"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
    if (json["category"] is List) {
      category = json["category"] == null ? null : List<String>.from(json["category"]);
    }
    if (json["director"] is List) {
      director = json["director"] == null ? null : List<String>.from(json["director"]);
    }
    if (json["actor"] is List) {
      actor = json["actor"] == null ? null : List<String>.from(json["actor"]);
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["startTime"] is int) {
      startTime = json["startTime"];
    }
    if (json["runningTime"] is int) {
      runningTime = json["runningTime"];
    }
    if (json["endTime"] is int) {
      endTime = json["endTime"];
    }
    if (json["heartTotal"] is int) {
      heartTotal = json["heartTotal"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["schedule"] is List) {
      schedule = json["schedule"] ?? [];
    }
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
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["loginCode"] is int) {
      loginCode = json["loginCode"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["googleId"] is String) {
      googleId = json["googleId"];
    }
    if (json["birth"] is String) {
      birth = json["birth"];
    }
    if (json["gender"] is int) {
      gender = json["gender"];
    }
    if (json["registerDate"] is int) {
      registerDate = json["registerDate"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["lastLogin"] is int) {
      lastLogin = json["lastLogin"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["userRole"] is int) {
      userRole = json["userRole"];
    }
    if (json["passwordChangeAt"] is int) {
      passwordChangeAt = json["passwordChangeAt"];
    }
    if (json["passwordResetToken"] is String) {
      passwordResetToken = json["passwordResetToken"];
    }
    if (json["passwordResetExpires"] is int) {
      passwordResetExpires = json["passwordResetExpires"];
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
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
