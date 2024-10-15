import 'dart:convert';

List<GetCommentsData> getCommentsDataFromJson(String str) => List<GetCommentsData>.from(json.decode(str).map((x) => GetCommentsData.fromJson(x)));

String getCommentsDataToJson(List<GetCommentsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCommentsData {
    int postId;
    int id;
    String name;
    String email;
    String body;

    GetCommentsData({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory GetCommentsData.fromJson(Map<String, dynamic> json) => GetCommentsData(
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
