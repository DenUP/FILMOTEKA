import 'package:filmoteka/ui/widgets/app/my_app.dart';
import 'package:filmoteka/ui/widgets/app/my_app_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final model = MyAppModel();
  await model.checkAuth();

  await Supabase.initialize(
    url: 'https://hocmobhnhmeqwrcltwdu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvY21vYmhuaG1lcXdyY2x0d2R1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxNTA5MTYsImV4cCI6MjAzMjcyNjkxNn0.b5C6PVC2t1Sax4qI5-xY1nTxvSjLciYEZHxTpTHKvQ0',
  );

  runApp(
    App(
      model: model,
    ),
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
