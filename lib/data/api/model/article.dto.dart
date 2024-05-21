import 'package:conduit/data/api/model/user.dto.dart';

class ArticleDTO {
  String? slug;
  String? title;
  String? description;
  String? body;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  bool? favorited;
  int? favoritesCount;
  UserDTO? author;

  ArticleDTO({
    this.slug,
    this.title,
    this.description,
    this.body,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.favorited,
    this.favoritesCount,
    this.author,
  });

  ArticleDTO.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    body = json['body'];
    tagList = json['tagList'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    favorited = json['favorited'];
    favoritesCount = json['favoritesCount'];
    author = json['author'] != null ? UserDTO.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['title'] = title;
    data['description'] = description;
    data['body'] = body;
    data['tagList'] = tagList;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['favorited'] = favorited;
    data['favoritesCount'] = favoritesCount;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    return data;
  }
}
