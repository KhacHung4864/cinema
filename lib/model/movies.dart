// ignore_for_file: prefer_collection_literals

class Movie {
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
  int? endTime;
  int? runningTime;
  int? heartTotal;
  int? status;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Movie(
      {this.name,
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
      this.endTime,
      this.runningTime,
      this.heartTotal,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Movie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    content = json['content'];
    videoUrl = json['videoUrl'];
    thumbnail = json['thumbnail'];
    category = json['category'].cast<String>();
    director = json['director'].cast<String>();
    actor = json['actor'].cast<String>();
    language = json['language'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    runningTime = json['runningTime'];
    heartTotal = json['heartTotal'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['content'] = content;
    data['videoUrl'] = videoUrl;
    data['thumbnail'] = thumbnail;
    data['category'] = category;
    data['director'] = director;
    data['actor'] = actor;
    data['language'] = language;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['runningTime'] = runningTime;
    data['heartTotal'] = heartTotal;
    data['status'] = status;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
