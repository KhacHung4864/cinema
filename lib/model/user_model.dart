class UserModel {
  String? id;
  String? name;
  String? avatar;
  String? email;
  String? phoneNumber;
  String? password;
  String? address;
  String? googleId;
  String? birth;
  int? gender;
  int? registerDate;
  int? lastLogin;
  int? status;
  int? userRole;
  int? passwordChangeAt;
  String? passwordResetToken;
  int? passwordResetExpires;

  UserModel(
      {this.id,
      this.name,
      this.avatar,
      this.email,
      this.phoneNumber,
      this.password,
      this.address,
      this.googleId,
      this.birth,
      this.gender,
      this.registerDate,
      this.lastLogin,
      this.status,
      this.userRole,
      this.passwordChangeAt,
      this.passwordResetToken,
      this.passwordResetExpires});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["avatar"] = avatar;
    _data["email"] = email;
    _data["phoneNumber"] = phoneNumber;
    _data["password"] = password;
    _data["address"] = address;
    _data["googleId"] = googleId;
    _data["birth"] = birth;
    _data["gender"] = gender;
    _data["registerDate"] = registerDate;
    _data["lastLogin"] = lastLogin;
    _data["status"] = status;
    _data["userRole"] = userRole;
    _data["passwordChangeAt"] = passwordChangeAt;
    _data["passwordResetToken"] = passwordResetToken;
    _data["passwordResetExpires"] = passwordResetExpires;
    return _data;
  }
}
