import 'package:conduit/data/api/model/article.dto.dart';
import 'package:conduit/data/repository/favorite.repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final _repository = FavoriteRepository();

  Future<ArticleDTO?> favoriteArticle({required String slug}) async {
    final article = await _repository.favoriteArticle(slug: slug);
    notifyListeners();
    return article;
  }

  Future<Response> unfavoriteArticle({required String slug}) async {
    final response = await _repository.unfavoriteArticle(slug: slug);
    notifyListeners();
    return response;
  }
}
