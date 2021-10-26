import 'package:adaus/Global/ui/components/image_component.dart';
import 'package:adaus/Global/ui/components/text_component.dart';
import 'package:adaus/Layout/ui/pages/layout_page.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';



class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({Key? key}) : super(key: key);

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final numeroTelefonoController = MaskedTextController(mask: '0 0000 0000');
  bool botonHabilitado = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SafeArea(child: SizedBox(height: 0)),

            customText(
              context,
              "Introduce tu número de teléfono para comenzar",
              "t1.black",
            ),
            const SizedBox(
              height: 10,
            ),
            customText(
              context,
              "Asegurate de que puedes recibir un SMS. Se aplican las tarifas de tu operador.",
              "s1.black",
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
                    child: SizedBox(
                      width: 15.0.w,
                      height: 7.0.h,
                      child: const TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF',),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(),
                          prefix: SizedBox(width: 10,),
                          counterText: "",
                          prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 50,),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
                    child: SizedBox(
                      width: 15.0.w,
                      height: 7.0.h,
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF',),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(),
                          prefix: SizedBox(width: 10,),
                          counterText: "",
                          prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 50,),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
                    child: SizedBox(
                      width: 15.0.w,
                      height: 7.0.h,
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF',),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(),
                          prefix: SizedBox(width: 10,),
                          counterText: "",
                          prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 50,),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
                    child: SizedBox(
                      width: 15.0.w,
                      height: 7.0.h,
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF',),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(),
                          prefix: SizedBox(width: 10,),
                          counterText: "",
                          prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 50,),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 6.0.h),
              child: MaterialButton(

                onPressed: () {
                  //Implement registration functionality.
                  Get.to(() => const LayoutPage());
                },
                color: const Color(0xFF0769f8),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
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
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 1.5.h, fontFamily: 'SF',
                    color: Colors.grey),
                children: const <TextSpan>[
                  TextSpan(text: ' Términos y condiciones de uso', style: TextStyle(decoration: TextDecoration.underline),),
                  TextSpan(text: ' y la'),
                  TextSpan(text: ' Política de privacidad', style: TextStyle(decoration: TextDecoration.underline),),
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



