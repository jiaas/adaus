import 'package:adaus/Session/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido al Onboarding'),
            SizedBox(
              width: 180,
              height: 60,
              child: TextButton(
                onPressed: () {
                  Get.off(() => const AuthScreen());
                },
                child: const Center(
                  child: Text(
                    'Inicia Sesión o Registrate',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
