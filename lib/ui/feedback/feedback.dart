// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';

List<Feedback> feedbackFromJson(String str) => List<Feedback>.from(json.decode(str).map((x) => Feedback.fromJson(x)));

String feedbackToJson(List<Feedback> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feedback {
  Feedback({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
