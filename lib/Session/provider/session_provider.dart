import 'package:adaus/Session/ui/pages/signup_page.dart';
import 'package:adaus/Session/ui/pages/verification_code_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SessionProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? idVerificacion;
  String? numeroTelefono = '+56 9 92900357';
  String? codigoSMS;
  User? user = FirebaseAuth.instance.currentUser;

  void actualizarNumeroTelefono(String nuevoNumeroTelefono) {
    numeroTelefono = nuevoNumeroTelefono;
    notifyListeners();
  }

  void actualizarCodigoSMS(String nuevoCodigoSMS) {
    codigoSMS = nuevoCodigoSMS;
    notifyListeners();
  }

  Future<void> _onVerificationCompleted(
    PhoneAuthCredential authCredential,
  ) async {
    print("verification completed ${authCredential.smsCode}");

    if (authCredential.smsCode != null) {
      try {
        codigoSMS = authCredential.smsCode;
        await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }
    } else {
      Get.to(() => const VerificationCodePage());
    }
  }

  void _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      //showMessage("The phone number entered is invalid!");
    }
  }

  void _onCodeSent(String verificationId, int? forceResendingToken) {
    print("code sent");
    idVerificacion = verificationId;
    //Get.to(VerificationCodePage());
  }

  void _onCodeTimeout(String timeout) {
    print("time out");
    //return null;
  }

  Future<void> verificarOTP(String otp) async {
    print(otp);
    print(idVerificacion);
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: idVerificacion.toString(),
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);

      user = _auth.currentUser;
      if (user != null) print('Usuario válido');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verificarTelefono() async {
    if (numeroTelefono != null) {
      await _auth.verifyPhoneNumber(
        phoneNumber: numeroTelefono.toString(),
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout,
      );
    }
  }

  Future<void> cerrarSesion() async {
    await _auth.signOut();
    Get.offAll(() => const SignUpPage());
  }
}
