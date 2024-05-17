import 'package:filmoteka/UI/widgets/auth/auth_widget.dart';
import 'package:filmoteka/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthWidgets(),
        '/main': (context) => const MainScreenWidget(),
      },
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
