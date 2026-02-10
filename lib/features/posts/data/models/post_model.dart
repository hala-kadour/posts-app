import 'dart:convert';

import '../../domain/entities/post_entity.dart';

// For Dio with Get All Posts API
List<PostModel> postModelFromList(List<dynamic> list) {
  return list
      .map((json) => PostModel.fromJson(Map<String, dynamic>.from(json)))
      .toList();
}

// For Locale Storage with Shared Prefernces
List<PostModel> postModelFromJson(String str) {
  final List decoded = jsonDecode(str);
  return decoded
      .map((json) => PostModel.fromJson(Map<String, dynamic>.from(json)))
      .toList();
}

String postModelToJson(List<PostModel> data) {
  return jsonEncode(data.map((x) => x.toJson()).toList());
}

class PostModel extends PostEntity {
  PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  PostModel copyWith({int? userId, int? id, String? title, String? body}) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
