import 'package:filmoteka/ui/widgets/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bmjllmkzywgdyypspszv.supabase.co',
    anonKey: 'sb_publishable_1OCGhc0JQ5KATEgtGDcQig_-7J2LfSi',
  );

  runApp(
    const App(),
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
