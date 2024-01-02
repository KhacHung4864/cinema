// ignore_for_file: no_leading_underscores_for_local_identifiers

class BookedModel {
  String? userId;
  String? filmId;
  String? scheduleId;
  List<int>? seat;
  int? showDate;
  String? showTime;
  int? price;
  bool? paid;
  int? createdAt;
  String? id;

  BookedModel({this.userId, this.filmId, this.scheduleId, this.seat, this.showDate, this.showTime, this.price, this.paid, this.createdAt, this.id});

  BookedModel.fromJson(Map<String, dynamic> json) {
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["filmId"] is String) {
      filmId = json["filmId"];
    }
    if (json["scheduleId"] is String) {
      scheduleId = json["scheduleId"];
    }
    if (json["seat"] is List) {
      seat = json["seat"] == null ? null : List<int>.from(json["seat"]);
    }
    if (json["showDate"] is int) {
      showDate = json["showDate"];
    }
    if (json["showTime"] is String) {
      showTime = json["showTime"];
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
    if (json["_id"] is String) {
      id = json["_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["filmId"] = filmId;
    _data["scheduleId"] = scheduleId;
    if (seat != null) {
      _data["seat"] = seat;
    }
    _data["showDate"] = showDate;
    _data["showTime"] = showTime;
    _data["price"] = price;
    _data["paid"] = paid;
    _data["createdAt"] = createdAt;
    _data["_id"] = id;
    return _data;
  }
}
