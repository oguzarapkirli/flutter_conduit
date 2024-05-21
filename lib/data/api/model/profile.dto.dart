import 'package:conduit/data/api/model/user.dto.dart';

class ProfileDTO {
  String? email;
  String? token;
  String? username;
  String? bio;
  String? image;

  ProfileDTO({
    this.email,
    this.token,
    this.username,
    this.bio,
    this.image,
  });

  ProfileDTO.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
    username = json['username'];
    bio = json['bio'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['token'] = token;
    data['username'] = username;
    data['bio'] = bio;
    data['image'] = image;
    return data;
  }

  UserDTO toUserDTO() {
    return UserDTO(
      username: username,
      bio: bio,
      image: image,
    );
  }
}
