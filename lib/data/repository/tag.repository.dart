import 'package:conduit/data/api/dio.client.dart';

// /tags GET
class TagRepository {
  final _client = DioClient();

  Future<List<String>> getTags() async {
    final response = await _client.request(
      url: '/tags',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['tags'] as List;
    return data.map((e) => e.toString()).toList();
  }
}
