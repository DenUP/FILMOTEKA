import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/ui/widgets/auth/auth_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgets extends StatelessWidget {
  const AuthWidgets({super.key});

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

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    return Column(
      children: [
        TextField(
          controller: model.loginController,
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
          controller: model.passwordController,
          keyboardType: TextInputType.visiblePassword,
          autocorrect: false,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        const _ErrorMesage(),

        TextButton(
          onPressed: () {},
          child: const Text('FORGOT PASSWORD',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        const SizedBox(
          height: 10,
        ),
        // Кнопка
        const _AuthButtonWidget(),
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
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthViewModel>();
    final onPressed = model.canStartAuth ? () => model.auth(context) : null;
    final inpProgress = model.isAuthProgress
        ? const CircularProgressIndicator()
        : const Text(
            'Log in',
            style: TextStyle(color: Colors.white, fontSize: 16),
          );
    return ClipRRect(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
              ),
              onPressed: onPressed,
              child: inpProgress)
        ],
      ),
    );
  }
}

class _ErrorMesage extends StatelessWidget {
  const _ErrorMesage();

  @override
  Widget build(BuildContext context) {
    final errorMesage = context.select((AuthViewModel vm) => vm.errorMessage);

    if (errorMesage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        errorMesage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
