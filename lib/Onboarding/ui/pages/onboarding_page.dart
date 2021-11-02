import 'package:adaus/Session/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
                  Get.off(() => const SignUpPage());
                },
                child: const Center(
                  child: Text(
                    'Inicia la aplicación.',
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
