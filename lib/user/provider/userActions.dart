import 'package:citrus_app_mobile/user/adapter/out/mockUserRepository.dart';
import 'package:citrus_app_mobile/user/adapter/out/userPersistenceAdapter.dart';
import 'package:citrus_app_mobile/user/adapter/out/userRepository.dart';
import 'package:citrus_app_mobile/user/application/port/out/loadUserPort.dart';
import 'package:citrus_app_mobile/user/application/service/showUserdetailsService.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'package:citrus_app_mobile/user/user.dart';
import 'package:flutter/material.dart';

class UserActions with ChangeNotifier {
  late Future<User> _currentUser;
  late ShowUserDetailsService _showUserDetailsService;

  UserActions() {
    loadUser();
  }

  Future<User> get currentUser {
    return this._currentUser;
  }

  set currentUser(Future<User> user) {
    _currentUser = user;
    notifyListeners();
  }

  void loadUser() {
    UserRepository userRepository = MockUserRepository();

    LoadUserPort loadUserPort = UserPersistenceAdapter(userRepository);

    _showUserDetailsService = ShowUserDetailsService(loadUserPort);

    this.currentUser = _showUserDetailsService.showDetailJobOffer(UserId(1));
  }
}
