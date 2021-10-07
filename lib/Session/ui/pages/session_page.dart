import 'package:adaus/Session/ui/pages/signin_page.dart';
import 'package:adaus/Session/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => const SignInPage());
          },
          child: const Text('Iniciar Sesión'),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpPage());
          },
          child: const Text('Solicitar Cuenta'),
        )
      ],
    );
  }
}
