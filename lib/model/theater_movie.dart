// ignore_for_file: no_leading_underscores_for_local_identifiers

class TheaterMovie {
  List<DataTheater>? data;
  int? count;
  int? status;

  TheaterMovie({this.data, this.count, this.status});

  TheaterMovie.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : (json["data"] as List).map((e) => DataTheater.fromJson(e)).toList();
    count = json["count"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["count"] = count;
    _data["status"] = status;
    return _data;
  }
}

class DataTheater {
  String? id;
  int? nRoom;
  int? createdAt;
  int? type;
  String? provinceCode;
  String? name;
  String? location;

  DataTheater({this.id, this.nRoom, this.createdAt, this.type, this.provinceCode, this.name, this.location});

  DataTheater.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nRoom = json["nRoom"];
    createdAt = json["createdAt"];
    type = json["type"];
    provinceCode = json["provinceCode"];
    name = json["name"];
    location = json["location"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["nRoom"] = nRoom;
    _data["createdAt"] = createdAt;
    _data["type"] = type;
    _data["provinceCode"] = provinceCode;
    _data["name"] = name;
    _data["location"] = location;
    return _data;
  }
}
