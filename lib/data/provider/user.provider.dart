import 'package:conduit/data/api/model/profile.dto.dart';
import 'package:conduit/data/api/request/auth.request.dart';
import 'package:conduit/data/repository/user.repository.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final _repository = UserRepository();

  ProfileDTO? _currentUser;
  ProfileDTO? get currentUser => _currentUser;

  Future<ProfileDTO> login({required AuthRequest body}) async {
    _currentUser = await _repository.login(body: body);
    notifyListeners();
    return _currentUser!;
  }

  Future<ProfileDTO> register({required AuthRequest body}) async {
    _currentUser = await _repository.register(body: body);
    notifyListeners();
    return _currentUser!;
  }

  Future<ProfileDTO> getUser() async {
    _currentUser = await _repository.getUser();
    notifyListeners();
    return _currentUser!;
  }

  Future<ProfileDTO> updateUser({required Map<String, dynamic> body}) async {
    _currentUser = await _repository.updateUser(body: body);
    notifyListeners();
    return _currentUser!;
  }
}
