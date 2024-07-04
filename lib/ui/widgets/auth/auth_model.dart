import 'dart:async';

import 'package:filmoteka/domain/services/auth_service.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  bool _isValid(String login, String password) =>
      login.isNotEmpty || password.isNotEmpty;

  Future<void> auth(BuildContext context) async {
    var login = loginController.text;
    var password = passwordController.text;
    if (!_isValid(login, password)) {
      _updateState('Введите логин и пароль', false);
      return;
    }
    _updateState(null, true);

    try {
      await _authService.login(login, password);
    } catch (e) {
      _updateState('Не правильный логин или пароль', false);
    }

    _isAuthProgress = false;
    notifyListeners();
    if (_errorMessage == null) {
      MainNavigation.resetNavigation(context);
    } else {
      _updateState(errorMessage, false);
    }
  }

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
      return;
    }
    _errorMessage = errorMessage;
    _isAuthProgress = isAuthProgress;
    notifyListeners();
  }
}
