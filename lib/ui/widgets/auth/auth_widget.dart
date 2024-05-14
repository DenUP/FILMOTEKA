import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
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
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.password_outlined),
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              hintText: 'Password'),
        ),
        const SizedBox(
          height: 40,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('FORGOT PASSWORD',
              style: TextStyle(
                  color: Color.fromRGBO(82, 82, 199, 1), fontSize: 14)),
        ),
        const SizedBox(
          height: 40,
        ),
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
                        horizontal: 100, vertical: 10),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
