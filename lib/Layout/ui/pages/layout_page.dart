import 'package:adaus/Session/provider/session_provider.dart';
import 'package:adaus/Session/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bienvenido al Layout.'),
              SizedBox(
                width: 180,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    Provider.of<SessionProvider>(context, listen: false)
                        .cerrarSesion()
                        .then(Get.offAll(()=> const SignUpPage()));
                  },
                  child: Text(
                    'Cerrar Sesión',
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
