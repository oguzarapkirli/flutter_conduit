class TagDTO {
  List<String>? tags;

  TagDTO({this.tags,});

  TagDTO.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tags'] = tags;
    return data;
  }
}
