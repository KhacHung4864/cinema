class ScheduleModel {
  String? id;
  String? filmId;
  FilmInfo? filmInfo;
  String? romId;
  List<String>? showTime;
  int? showDate;
  int? startTime;
  int? endTime;
  int? nSeat;
  int? createdAt;

  ScheduleModel({this.id, this.filmId, this.filmInfo, this.romId, this.showTime, this.showDate, this.startTime, this.endTime, this.nSeat, this.createdAt});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["filmId"] is String) {
      filmId = json["filmId"];
    }
    if (json["filmInfo"] is Map) {
      filmInfo = json["filmInfo"] == null ? null : FilmInfo.fromJson(json["filmInfo"]);
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
    if (filmInfo != null) {
      _data["filmInfo"] = filmInfo?.toJson();
    }
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
