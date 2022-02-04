

import 'dart:convert';

import 'package:flutter_test_entretient/feature/post/domaine/entities/post.dart';

List<PostData> postFromJson(String str) => List<PostData>.from(json.decode(str).map((x) => PostData.fromJson(x)));

String postToJson(List<PostData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostData extends Post {
    PostData({
        this.userId,
        this.id,
        this.title,
        this.body,
    }):super(
      userId: userId,
      id: id,
      body: body,
      title: title,
    );

    int? userId;
    int? id;
    String? title;
    String? body;

    factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId??"",
        "id": id??"",
        "title": title,
        "body": body,
    };
}
