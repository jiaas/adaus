import 'package:adaus/Global/ui/components/image_component.dart';
import 'package:adaus/Global/ui/components/text_component.dart';
import 'package:adaus/Session/provider/session_provider.dart';
import 'package:adaus/Session/ui/screens/verification_code_screen.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late bool isLoading = false;
  String? verificationId;
  final numeroTelefonoController = MaskedTextController(mask: '0 0000 0000');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    numeroTelefonoController.dispose();
    super.dispose();
  }

  void showSnackBar(String msg, Color? color, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        elevation: 3.0,
        backgroundColor: color,
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK!'),
          )
        ],
      ),
    );
  }

  void verifyPhone(BuildContext context, String numeroTelefono) {
    try {
      Provider.of<SessionProvider>(context, listen: false)
          .verificarTelefono(numeroTelefono)
          .then((value) {
        Get.to(() => const VerificationCodeScreen());
      }).catchError((e) {
        String errorMsg = 'Cant Authenticate you, Try Again Later';
        if (e.toString().contains(
              'We have blocked all requests from this device due to unusual activity. Try again later.',
            )) {
          errorMsg = 'Please wait as you have used limited number request';
        }
        _showErrorDialog(context, errorMsg);
      });
    } catch (e) {
      _showErrorDialog(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(child: SizedBox(height: 2.0.h)),
            customText(
              context,
              "Introduce tu n??mero de tel??fono para comenzar",
              "t1.black",
            ),
            SizedBox(
              height: 2.0.h,
            ),
            customText(
              context,
              "Asegurate de que puedes recibir un SMS. Se aplican las tarifas de tu operador.",
              "s1.black",
            ),
            SizedBox(
              height: 2.5.h,
            ),
            SizedBox(
              width: 30.0.w,
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF',
                ),
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  prefix: const SizedBox(
                    width: 10,
                  ),
                  hintText: 'Chile',
                  prefixIcon: customImage('chile.png', 5, 5),
                  prefixIconConstraints: const BoxConstraints(
                    minHeight: 30,
                    minWidth: 50,
                  ),
                  suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
                ),
              ),
            ),
            SizedBox(
              height: 3.0.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25.0.w,
                  child: const TextField(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: '56',
                      prefixIcon: Icon(
                        Icons.add_circle_outline_sharp,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                SizedBox(
                  width: 60.0.w,
                  child: TextField(
                    controller: numeroTelefonoController,
                    maxLength: 11,
                    autofocus: true,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF',
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hoverColor: Color(0xFF2675EC),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'N??mero de Tel??fono',
                      hintText: 'Ingrese su n??mero',
                      counterText: "",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SF',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2675EC),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: MaterialButton(
                onPressed: () async {
                  verifyPhone(context, numeroTelefonoController.text);
                },
                color: const Color(0xFF0769f8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                minWidth: 200.0,
                height: 42.0,
                child: customText(
                  context,
                  "CONTINUAR",
                  "t2.white",
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Al continuar aceptas los',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 1.5.h,
                      fontFamily: 'SF',
                      color: Colors.grey,
                    ),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' T??rminos y condiciones de uso',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: ' y la'),
                  TextSpan(
                    text: ' Pol??tica de privacidad',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: ' de ADAUS.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
