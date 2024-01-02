class DetailMovie {
  String? sId;
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
  List<String>? schedule;
  String? createdAt;
  String? updatedAt;

  DetailMovie(
      {this.sId,
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
      this.endTime,
      this.runningTime,
      this.heartTotal,
      this.status,
      this.schedule,
      this.createdAt,
      this.updatedAt});

  DetailMovie.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    schedule = json['schedule'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['content'] = this.content;
    data['videoUrl'] = this.videoUrl;
    data['thumbnail'] = this.thumbnail;
    data['category'] = this.category;
    data['director'] = this.director;
    data['actor'] = this.actor;
    data['language'] = this.language;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['runningTime'] = this.runningTime;
    data['heartTotal'] = this.heartTotal;
    data['status'] = this.status;
    data['schedule'] = this.schedule;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
