import 'package:adaus/Session/ui/screens/auth_screen.dart';
import 'package:adaus/Session/ui/screens/verification_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SessionProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? idVerificacion;
  String? numeroTelefono;
  String? codigoSMS;
  String? otp;
  User? user = FirebaseAuth.instance.currentUser;

  actualizarNumeroTelefono(String nuevoNumeroTelefono) {
    print("Se remplazó el número $numeroTelefono");
    numeroTelefono = "+56 $nuevoNumeroTelefono";
    print("Por el número $numeroTelefono");
    notifyListeners();
  }

  actualizarCodigoSMS(String nuevoCodigoSMS) {
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
      Get.to(() => const VerificationCodeScreen());
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
  }

  void _onCodeTimeout(String timeout) {
    print("time out");
    //return null;
  }

  Future<void> verificarOTP(String smsCode) async {
    actualizarCodigoSMS(smsCode);
    print("OTP: $otp \n Numero Teléfono: $numeroTelefono");

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: idVerificacion.toString(),
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);

      user = _auth.currentUser;
      if (user != null) print('Usuario válido');
    } catch (e) {
      rethrow;
    }
  }

  verificarTelefono(String nuevoNumeroTelefono) async {
    actualizarNumeroTelefono(nuevoNumeroTelefono);

    print("OTP: $otp \n Numero Teléfono: $numeroTelefono");
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
    Get.offAll(() => const AuthScreen());
  }
}
