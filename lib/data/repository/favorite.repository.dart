import 'package:conduit/data/api/dio.client.dart';
import 'package:conduit/data/api/model/article.dto.dart';
import 'package:dio/dio.dart';

// /favorites/:slug POST
// /favorites/:slug DELETE
class FavoriteRepository {
  final _client = DioClient();

  Future<ArticleDTO> favoriteArticle({required String slug}) async {
    final response = await _client.request(
      url: '/articles/$slug/favorite',
      requestType: RequestType.POST,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['article'];
    return ArticleDTO.fromJson(data);
  }

  Future<Response> unfavoriteArticle({required String slug}) async {
    final response = await _client.request(
      url: '/articles/$slug/favorite',
      requestType: RequestType.DELETE,
      requestBodyType: RequestBodyType.JSON,
    );
    return response;
  }
}
