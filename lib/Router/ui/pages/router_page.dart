import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
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
      //Si es true entonces ya había entrado a la app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Column(
              children: [
                Text('You have been here before'),
              ],
            ),
          ),
        ),
      );
    } else {
      //Si es false entonces es la primera vez que abre la app
      await prefs.setBool('seen',
          true); // seen queda como true y la próxima vez entrará al bloque de arriba.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Column(
              children: [
                Text('This is your first time'),
              ],
            ),
          ),
        ),
      );
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
