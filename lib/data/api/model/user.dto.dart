class UserDTO {
  String? username;
  String? bio;
  String? image;
  bool? following;

  UserDTO({
    this.username,
    this.bio,
    this.image,
    this.following,
  });

  UserDTO.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    bio = json['bio'];
    image = json['image'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['bio'] = bio;
    data['image'] = image;
    data['following'] = following;
    return data;
  }
}
