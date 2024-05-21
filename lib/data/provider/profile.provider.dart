import 'package:conduit/data/api/model/user.dto.dart';
import 'package:conduit/data/repository/profile.repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final _repository = ProfileRepository();

  UserDTO? _profile;
  UserDTO? get profile => _profile;

  Future<UserDTO> getProfile({required String username}) async {
    _profile = await _repository.getProfile(username: username);
    notifyListeners();
    return _profile!;
  }

  Future<UserDTO> followProfile({required String username}) async {
    _profile = await _repository.followProfile(username: username);
    notifyListeners();
    return _profile!;
  }

  Future<Response> unfollowProfile({required String username}) async {
    final response = await _repository.unfollowProfile(username: username);
    notifyListeners();
    return response;
  }
}
