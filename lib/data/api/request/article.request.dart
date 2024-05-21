class ArticleRequest {
  String? title;
  String? description;
  String? body;
  List<String>? tagList;

  ArticleRequest({this.title, this.description, this.body, this.tagList});

  ArticleRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    body = json['body'];
    tagList = json['tagList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['body'] = body;
    data['tagList'] = tagList;
    return data;
  }
}
