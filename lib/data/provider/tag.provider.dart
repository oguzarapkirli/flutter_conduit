import 'package:conduit/data/repository/tag.repository.dart';
import 'package:flutter/material.dart';

class TagProvider extends ChangeNotifier {
  final _repository = TagRepository();

  final List<String> _tags = [];
  List<String> get tags => _tags;

  Future<List<String>> getTags() async {
    final response = await _repository.getTags();
    return response;
  }
}
