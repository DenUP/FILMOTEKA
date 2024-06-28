import 'package:filmoteka/domain/services/auth_service.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class LoaderViewModel {
  final _authService = AuthService();
  BuildContext context;

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.isAuth();
    final nextPage = isAuth
        ? MainNavigationRouteName.mainScreen
        : MainNavigationRouteName.auth;
    Navigator.of(context).pushReplacementNamed(nextPage);
  }
}
