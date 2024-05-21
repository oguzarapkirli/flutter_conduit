import 'package:conduit/data/api/model/article.dto.dart';
import 'package:conduit/data/api/query/article.query.dart';
import 'package:conduit/data/api/request/article.request.dart';
import 'package:conduit/data/repository/article.repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ArticleProvider extends ChangeNotifier {
  final _repository = ArticleRepository();

  final List<ArticleDTO> _articles = [];
  List<ArticleDTO> get articles => _articles;

  final List<ArticleDTO> _feedArticles = [];
  List<ArticleDTO> get feedArticles => _feedArticles;

  ArticleDTO? _article;
  ArticleDTO? get article => _article;

  Future<List<ArticleDTO>> getArticles({ArticleQuery? query}) async {
    final response = await _repository.getArticles(query: query);
    _articles.addAll(response);
    notifyListeners();
    return _articles;
  }

  Future<List<ArticleDTO>> getFeedArticles({ArticleQuery? query}) async {
    final response = await _repository.getFeedArticles(query: query);
    _feedArticles.addAll(response);
    notifyListeners();
    return _feedArticles;
  }

  Future<ArticleDTO?> createArticle({required ArticleRequest body}) async {
    _article = await _repository.createArticle(body: body);
    notifyListeners();
    return _article;
  }

  Future<ArticleDTO?> getArticle({required String slug}) async {
    _article = await _repository.getArticle(slug: slug);
    notifyListeners();
    return _article;
  }

  Future<ArticleDTO?> updateArticle(
      {required String slug, required ArticleRequest body}) async {
    _article = await _repository.updateArticle(slug: slug, body: body);
    notifyListeners();
    return _article;
  }

  Future<Response> deleteArticle({required String slug}) async {
    final response = await _repository.deleteArticle(slug: slug);
    notifyListeners();
    return response;
  }
}
