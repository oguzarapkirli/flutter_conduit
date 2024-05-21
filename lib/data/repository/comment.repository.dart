import 'package:conduit/data/api/dio.client.dart';
import 'package:conduit/data/api/model/comment.dto.dart';
import 'package:conduit/data/api/request/comment.request.dart';
import 'package:dio/dio.dart';

// /articles/:slug/comments GET
// /articles/:slug/comments POST
// /articles/:slug/comments/:id DELETE
class CommentRepository {
  final _client = DioClient();

  Future<List<CommentDTO>> getComments({required String slug}) async {
    final response = await _client.request(
      url: '/articles/$slug/comments',
      requestType: RequestType.GET,
      requestBodyType: RequestBodyType.JSON,
    );
    final data = response.data['comments'] as List;
    return data.map((e) => CommentDTO.fromJson(e)).toList();
  }

  Future<CommentDTO> createComment(
      {required String slug, required CommentRequest body}) async {
    final response = await _client.request(
      url: '/articles/$slug/comments',
      requestType: RequestType.POST,
      requestBodyType: RequestBodyType.JSON,
      data: body.toJson(),
    );
    final data = response.data['comment'];
    return CommentDTO.fromJson(data);
  }

  Future<Response> deleteComment(
      {required String slug, required String id}) async {
    final response = await _client.request(
      url: '/articles/$slug/comments/$id',
      requestType: RequestType.DELETE,
      requestBodyType: RequestBodyType.JSON,
    );
    return response;
  }
}
