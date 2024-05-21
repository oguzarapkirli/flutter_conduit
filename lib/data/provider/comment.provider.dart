import 'package:conduit/data/api/model/comment.dto.dart';
import 'package:conduit/data/api/request/comment.request.dart';
import 'package:conduit/data/repository/comment.repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CommentProvider extends ChangeNotifier {
  final _repository = CommentRepository();

  List<CommentDTO> _comments = [];
  List<CommentDTO> get comments => _comments;

  CommentDTO? _comment;
  CommentDTO? get comment => _comment;

  Future<List<CommentDTO>> getComments({required String slug}) async {
    _comments = await _repository.getComments(slug: slug);
    notifyListeners();
    return _comments;
  }

  Future<CommentDTO?> createComment(
      {required String slug, required CommentRequest body}) async {
    _comment = await _repository.createComment(slug: slug, body: body);
    notifyListeners();
    return _comment!;
  }

  Future<Response> deleteComment(
      {required String slug, required String id}) async {
    final response = await _repository.deleteComment(slug: slug, id: id);
    notifyListeners();
    return response;
  }
}
