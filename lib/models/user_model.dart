// To parse this JSON data, do
//
//     final userRequest = userRequestFromJson(jsonString);

import 'dart:convert';

UserRequest userRequestFromJson(String str) => UserRequest.fromJson(json.decode(str));

String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
  UserRequest({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.user,
  });

  String title;
  String description;
  String dateTime;
  String user;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
    title: json["title"],
    description: json["description"],
    dateTime: json["dateTime"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "dateTime": dateTime,
    "user": user,
  };
}
