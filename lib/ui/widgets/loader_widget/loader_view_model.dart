import 'package:filmoteka/domain/data_provider/session_data_provider.dart';
import 'package:filmoteka/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class LoaderViewModel {
  BuildContext context;
  final _sessionDataProvider = SessionDataProvider();
  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final isAuth = sessionId != null;
    final nextPage = isAuth
        ? MainNavigationRouteName.mainScreen
        : MainNavigationRouteName.auth;
    Navigator.of(context).pushReplacementNamed(nextPage);
  }
}
