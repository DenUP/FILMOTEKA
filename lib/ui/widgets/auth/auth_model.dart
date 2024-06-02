import 'package:filmoteka/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthModel extends ChangeNotifier {
  // final _apiClient = ApiClient();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    var login = loginController.text;
    var password = passwordController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Введите логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();

    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: loginController.text,
        password: passwordController.text,
      );

      final Session? session = res.session;
      final User? user = res.user;
    } catch (e) {
      _errorMessage = 'Не правильный логин или пароль';
    }
    _isAuthProgress = false;
    notifyListeners();

    // Navigator.of(context).pushNamed('/main');
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    required this.model,
    required super.child,
    super.key,
  }) : super(
          notifier: model,
        );

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
