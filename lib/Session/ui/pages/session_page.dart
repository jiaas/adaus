import 'package:adaus/Session/ui/components/slider_component.dart';
import 'package:adaus/Session/ui/pages/signin_page.dart';
import 'package:adaus/Session/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SliderComponent(),
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
      ),
    );
  }
}
