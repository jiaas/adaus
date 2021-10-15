import 'package:adaus/Layout/ui/pages/layout_page.dart';
import 'package:adaus/Onboarding/ui/pages/onboarding_page.dart';
import 'package:adaus/Session/ui/pages/session_page.dart';
import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouterPage extends StatefulWidget {
  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage>
    with AfterLayoutMixin<RouterPage> {
  Future checkFirstSeen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _seen = prefs.getBool('seen') ?? false; // seen queda como false

    if (_seen) {
      //seen es true entonces ya había entrado a la app y debo redirigirlo

      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null) {
          await Get.off(() => const SessionPage());
        } else {
          await Get.off(() => const LayoutPage());
        }
      });
    } else {
      //Si es false entonces es la primera vez que abre la app
      await prefs.setBool(
        'seen',
        true,
      ); // seen queda como true y la próxima vez entrará al bloque de arriba.
      await Get.off(() => const OnboardingPage());
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF673AB7),
      body: Center(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Center(
                child: Text('adaus jeje'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
