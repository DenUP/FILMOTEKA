import 'package:filmoteka/domain/data_provider/session_data_provider.dart';
import 'package:filmoteka/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _sessionDataProvider = SessionDataProvider(); 
  Future<bool> isAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String login, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: login,
      password: password,
    );

    final Session? session = res.session;
    // final User? user = res.user;
    final sessionId = session?.refreshToken;
    // подождем пока запишется

    await _sessionDataProvider.setSesionId(sessionId);
  }
}
