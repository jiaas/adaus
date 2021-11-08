import 'package:adaus/Session/provider/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bienvenido al Layout.'),
              SizedBox(
                width: 180,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    Provider.of<SessionProvider>(context, listen: false)
                        .cerrarSesion();
                  },
                  child: const Text(
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
