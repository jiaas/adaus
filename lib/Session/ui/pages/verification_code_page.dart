import 'package:adaus/Global/ui/components/text_component.dart';
import 'package:adaus/Layout/ui/pages/layout_page.dart';
import 'package:adaus/Session/provider/session_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

final codigoSMSController = TextEditingController();

class VerificationCodePage extends StatefulWidget {
  //final String numeroTelefono;
  const VerificationCodePage();//this.numeroTelefono);

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    codigoSMSController.text = "";
    super.dispose();
  }

  showSnackBar(String msg, Color? color, BuildContext context) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: new Duration(seconds: 2),
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
        title: Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK!'),
          )
        ],
      ),
    );
  }

  verifyOTP(BuildContext context){
    try {
      Provider.of<SessionProvider>(context, listen: false)
          .verificarOTP(codigoSMSController.text.toString())
          .then((_) {
        Get.offAll(()=> const LayoutPage());
      }).catchError((e) {
        String errorMsg = e.toString();
        if (e.toString().contains("ERROR_SESSION_EXPIRED")) {
          errorMsg = "Session expired, please resend OTP!";
        } else if (e
            .toString()
            .contains("ERROR_INVALID_VERIFICATION_CODE")) {
          errorMsg = "You have entered wrong OTP!";
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
              "Introduce tu número de teléfono para comenzar",
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 2.0.h, horizontal: 2.0.w),
                    child: SizedBox(
                      width: 80.0.w,
                      height: 7.0.h,
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        controller: codigoSMSController,
                        //maxLength: 1,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF',
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(),
                          prefix: SizedBox(
                            width: 10,
                          ),
                          counterText: "",
                          prefixIconConstraints: BoxConstraints(
                            minHeight: 30,
                            minWidth: 50,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0.h),
              child: MaterialButton(
                onPressed: () async {
                   //await _verificarSMS(context, //widget.numeroTelefono);
                  verifyOTP(context);
                },
                color: const Color(0xFF0769f8),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
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
                    fontSize: 1.5.h, fontFamily: 'SF', color: Colors.grey),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' Términos y condiciones de uso',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: ' y la'),
                  TextSpan(
                    text: ' Política de privacidad',
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


