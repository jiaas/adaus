import 'package:adaus/Session/pages/login_page.dart';
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
            Text('Onboarding'),
            Container(
              width: 180,
              height: 60,
              child: TextButton(
                onPressed: () {
                  //Get.to(OnboardingCarousel());
                  print('asd');
                  Get.off(const SignInPage());
                  //Get.to(SignInPage());
                },
                child: Center(
                  child: Text(
                    'Get Started',
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
