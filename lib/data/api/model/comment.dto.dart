import 'package:conduit/data/api/model/user.dto.dart';

class CommentDTO {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? body;
  UserDTO? author;

  CommentDTO({this.id, this.createdAt, this.updatedAt, this.body, this.author,});

  CommentDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    body = json['body'];
    author = json['author'] != null ? UserDTO.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['body'] = body;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    return data;
  }
}
