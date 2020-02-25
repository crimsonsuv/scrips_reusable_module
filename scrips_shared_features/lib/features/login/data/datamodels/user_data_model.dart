// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  bool success;
  User user;

  UserData({
    this.success,
    this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        success: json["success"] == null ? null : json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "user": user == null ? null : user.toJson(),
      };
}

class User {
  int userId;
  String image;
  String userName;
  String fullName;
  String phoneNumber;
  String gender;
  String lastLoggedIn;
  String accessToken;
  String email;
  String password;

  User({
    this.userId,
    this.image,
    this.userName,
    this.fullName,
    this.phoneNumber,
    this.gender,
    this.lastLoggedIn,
    this.accessToken,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] == null ? null : json["user_id"],
        image: json["image"] == null ? null : json["image"],
        userName: json["user_name"] == null ? null : json["user_name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        gender: json["gender"] == null ? null : json["gender"],
        lastLoggedIn:
            json["last_logged_in"] == null ? null : json["last_logged_in"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "image": image == null ? null : image,
        "user_name": userName == null ? null : userName,
        "full_name": fullName == null ? null : fullName,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "gender": gender == null ? null : gender,
        "last_logged_in": lastLoggedIn == null ? null : lastLoggedIn,
        "access_token": accessToken == null ? null : accessToken,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
