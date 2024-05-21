import 'package:conduit/data/api/dio.client.dart';
import 'package:conduit/data/api/model/profile.dto.dart';
import 'package:conduit/data/api/request/auth.request.dart';

// /users/login POST
// /users POST
// /user GET
// /user PUT
class UserRepository {
  final _client = DioClient();

  Future<ProfileDTO> login({required AuthRequest body}) async {
    final response = await _client.request(
      url: '/users/login',
      requestType: RequestType.POST,
      requestBodyType: RequestBodyType.JSON,
      data: body.toJson(),
    );
    final data = response.data['user'];
    return ProfileDTO.fromJson(data);
  }

  Future<ProfileDTO> register({required AuthRequest body}) async {
    final response = await _client.request(
      url: '/users',
      requestType: RequestType.POST,
      requestBodyType: RequestBodyType.JSON,
      data: body.toJson(),
    );
    final data = response.data['user'];
    return ProfileDTO.fromJson(data);
  }

  Future<ProfileDTO> getUser() async {
    final response = await _client.request(
      url: '/user',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['user'];
    return ProfileDTO.fromJson(data);
  }

  Future<ProfileDTO> updateUser({required Map<String, dynamic> body}) async {
    final response = await _client.request(
      url: '/user',
      requestType: RequestType.PUT,
      requestBodyType: RequestBodyType.JSON,
      data: body,
    );
    final data = response.data['user'];
    return ProfileDTO.fromJson(data);
  }
}
