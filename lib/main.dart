// В main.dart добавьте проверку
import 'package:filmoteka/domain/services/supbase_service.dart';
import 'package:filmoteka/ui/widgets/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Вызовите в main()
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bmjllmkzywgdyypspszv.supabase.co',
    anonKey: 'sb_publishable_1OCGhc0JQ5KATEgtGDcQig_-7J2LfSi',
  );

  runApp(const App());
}
