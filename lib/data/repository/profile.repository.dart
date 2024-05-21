import 'package:conduit/data/api/dio.client.dart';
import 'package:conduit/data/api/model/user.dto.dart';
import 'package:dio/dio.dart';

// /profiles/:username GET
// /profiles/:username/follow POST
// /profiles/:username/follow DELETE
class ProfileRepository {
  final _client = DioClient();

  Future<UserDTO> getProfile({required String username}) async {
    final response = await _client.request(
      url: '/profiles/$username',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['profile'];
    return UserDTO.fromJson(data);
  }

  Future<UserDTO> followProfile({required String username}) async {
    final response = await _client.request(
      url: '/profiles/$username/follow',
      requestType: RequestType.POST,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['profile'];
    return UserDTO.fromJson(data);
  }

  Future<Response> unfollowProfile({required String username}) async {
    final response = await _client.request(
      url: '/profiles/$username/follow',
      requestType: RequestType.DELETE,
      requestBodyType: RequestBodyType.JSON,
    );
    return response;
  }
}
