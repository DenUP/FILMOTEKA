import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/Theme/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthWidgets extends StatefulWidget {
  const AuthWidgets({super.key});

  @override
  State<AuthWidgets> createState() => _AuthWidgetsState();
}

class _AuthWidgetsState extends State<AuthWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset(
                'assets/auth/auth.png',
              ),
              const Text(
                'Welcome to FILMOTEKA',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 48),
                child: const _FormWidget(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');

  String? errorText = null; // maybe null is not
  void _auth() {
    final login = _loginController.text;
    final password = _passwordController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main');
    } else {
      errorText = 'Не верный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {}

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      children: [
        TextField(
          controller: _loginController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'Email',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          autocorrect: false,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        if (errorText != null)
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                errorText,
                style: const TextStyle(color: colors.error),
              ),
            ],
          ),

        TextButton(
          onPressed: () {},
          child: const Text('FORGOT PASSWORD',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        const SizedBox(
          height: 10,
        ),
        // Кнопка
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  colors.lightBlue,
                  colors.blue,
                ])),
              )),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 15),
                  ),
                  onPressed: () {
                    _auth();
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
              text: 'Don\'t have account?',
              style: const TextStyle(fontSize: 14, color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                    text: 'SIGN UP',
                    style: const TextStyle(color: colors.lightBlue),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ]),
        ),

        //   mainAxisAlignment: MainAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.max,
        //   children: [
        //     const Text('Don\'t have account?'),
        //     TextSpan(
        //       onPressed: () {}, child: const Text('SIGN UP'))
        //   ],
        // )
      ],
    );
  }
}
