import 'package:adaus/Onboarding/ui/pages/onboarding_page.dart';
import 'package:adaus/Session/pages/login_page.dart';
import 'package:after_layout/after_layout.dart';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false); // seen queda como false

    if (_seen) {
      //seen es true entonces ya había entrado a la app y debo redirigirlo
      //TODO: Aqui debo validar la session
      /*var session = null;

      var proximaPagina = null;

      if (session != null) {
        session = true;
      } else {
        session = false;
      }

      switch (session) {
        case true:
          proximaPagina = 'LandingPage()';
          break;
        case false:
          proximaPagina = 'LoginOrRegistrationPage()';
          break;
        default:
          proximaPagina = 'LoginOrRegistrationPage()';
          break;
      }
      Get.off(() => proximaPagina);
      */
      Get.off(() => SignInPage());
    } else {
      //Si es false entonces es la primera vez que abre la app
      await prefs.setBool('seen',
          true); // seen queda como true y la próxima vez entrará al bloque de arriba.
      Get.off(() => OnboardingPage());
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF673AB7),
      body: new Center(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('adaus jeje'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
