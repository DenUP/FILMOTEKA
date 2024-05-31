import 'package:filmoteka/Theme/theme_class.dart';
import 'package:filmoteka/UI/widgets/auth/auth_widget.dart';
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_widgets.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme,
      routes: {
        '/': (context) => AuthProvider(
              model: AuthModel(),
              child: const AuthWidgets(),
            ),
        '/main': (context) => const MainScreenWidget(),
        '/main/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidgets(movieId: arguments);
          } else {
            return const MovieDetailsWidgets(movieId: 0);
            ;
          }
        }
      },
      initialRoute: '/',

      // OPEN ERROR PAGE
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Упс, Вы ошиблись страницой',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/'),
                      child: const Text('Домой'))
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
