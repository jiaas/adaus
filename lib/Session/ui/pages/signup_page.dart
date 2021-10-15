import 'package:adaus/Global/ui/components/image_component.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:adaus/Global/ui/components/text_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

const List<DropdownMenuItem<String>> paises = [];


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SafeArea(child: SizedBox(height: 10)),
            const SizedBox(
              height: 50,
            ),
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
              "Recibirás un código de verificación SMS. Se aplican las tarifas de tu operador.",
              "s1.black",
            ),
            const SizedBox(
              height: 48.0,
            ),
            SizedBox(
              width: 30.0.w,
              child: TextField(
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF',),
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  prefix: SizedBox(width: 10,),
                  hintText: 'Chile',
                  prefixIcon: customImage('chile.png', 5,5),
                  prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 50,),
                  suffixIcon: Icon(Icons.arrow_drop_down_circle_outlined),

                ),
              ),
            ),
           SizedBox(
             height: 3.0.h,
           ),
            Row(
              children: [
                SizedBox(
                  width: 30.0.w,
                  child: const TextField(
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',),
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: '56',
                      prefixIcon: Icon(Icons.add_circle_outline_sharp, size: 18,),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 51.0.w,
                  child: TextField(
                    controller: numeroTelefonoController,
                    maxLength: 11,

                    autofocus: true,
                    style:  const TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF',),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hoverColor: Color(0xFF2675EC),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Número de Teléfono',
                      hintText: 'Ingrese su número',
                      counterText: "",
                      labelStyle: TextStyle(fontSize: 20,
                        fontFamily: 'SF',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2675EC),),
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

                onPressed: () {
                  //Implement registration functionality.
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
          ],
        ),
      ),
    );
  }

}

