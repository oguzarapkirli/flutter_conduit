class ArticleQuery {
  String? tag;
  String? author;
  String? favorited;
  int? limit;
  int? offset;

  ArticleQuery({
    this.tag,
    this.author,
    this.favorited,
    this.limit,
    this.offset,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tag'] = tag;
    data['author'] = author;
    data['favorited'] = favorited;
    data['limit'] = limit;
    data['offset'] = offset;
    return data;
  }
}
