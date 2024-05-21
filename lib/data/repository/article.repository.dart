import 'package:conduit/data/api/dio.client.dart';
import 'package:conduit/data/api/model/article.dto.dart';
import 'package:conduit/data/api/query/article.query.dart';
import 'package:conduit/data/api/request/article.request.dart';
import 'package:dio/dio.dart';

// /articles GET
// /articles/feed GET
// /articles POST
// /articles/:slug GET
// /articles/:slug PUT
// /articles/:slug DELETE
class ArticleRepository {
  final _client = DioClient();

  Future<List<ArticleDTO>> getArticles({ArticleQuery? query}) async {
    final response = await _client.request(
      url: '/articles',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
      queryParameters: query?.toJson(),
    );
    final data = response.data['articles'] as List;
    return data.map((e) => ArticleDTO.fromJson(e)).toList();
  }

  Future<List<ArticleDTO>> getFeedArticles({ArticleQuery? query}) async {
    final response = await _client.request(
      url: '/articles/feed',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
      queryParameters: query?.toJson(),
    );
    final data = response.data['articles'] as List;
    return data.map((e) => ArticleDTO.fromJson(e)).toList();
  }

  Future<ArticleDTO> createArticle({required ArticleRequest body}) async {
    final response = await _client.request(
      url: '/articles',
      requestType: RequestType.POST,
      requestBodyType: RequestBodyType.JSON,
      data: body.toJson(),
    );
    final data = response.data['article'];
    return ArticleDTO.fromJson(data);
  }

  Future<ArticleDTO> getArticle({required String slug}) async {
    final response = await _client.request(
      url: '/articles/$slug',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['article'];
    return ArticleDTO.fromJson(data);
  }

  Future<ArticleDTO> updateArticle(
      {required String slug, required ArticleRequest body}) async {
    final response = await _client.request(
      url: '/articles/$slug',
      requestType: RequestType.PUT,
      requestBodyType: RequestBodyType.JSON,
      data: body.toJson(),
    );
    final data = response.data['article'];
    return ArticleDTO.fromJson(data);
  }

  Future<Response> deleteArticle({required String slug}) async {
    final response = await _client.request(
      url: '/articles/$slug',
      requestType: RequestType.DELETE,
      requestBodyType: RequestBodyType.JSON,
    );
    return response;
  }
}
