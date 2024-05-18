import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/Theme/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthWidgets extends StatefulWidget {
  const AuthWidgets({super.key});

  @override
  State<AuthWidgets> createState() => _AuthWidgetsState();
}

class _AuthWidgetsState extends State<AuthWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/auth/auth.png',
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 48),
              child: _FormWidget(),
            ),
          ],
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
          decoration: const InputDecoration(
              isCollapsed: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              hintText: 'Email'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: _passwordController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          obscureText: true,
          decoration: mainStyle.decorationText,
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
              style: TextStyle(
                  color: Color.fromRGBO(82, 82, 199, 1), fontSize: 14)),
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
                  Color.fromRGBO(136, 139, 244, 1),
                  Color.fromRGBO(81, 81, 198, 1)
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
              style: const TextStyle(fontSize: 14, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'SIGN UP',
                    style: const TextStyle(color: colors.purple2),
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
