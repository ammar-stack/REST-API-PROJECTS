// To parse this JSON data, do
//
//     final commentData = commentDataFromJson(jsonString);

import 'dart:convert';

List<CommentData> commentDataFromJson(String str) => List<CommentData>.from(json.decode(str).map((x) => CommentData.fromJson(x)));

String commentDataToJson(List<CommentData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentData {
    int postId;
    int id;
    String name;
    String email;
    String body;

    CommentData({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
