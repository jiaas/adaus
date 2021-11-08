import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String? email;
  late String firstName;
  late bool hasRun;
  late bool isEnabled;
  late String lastName;
  late String mobile;
  String? passport;
  String? userRun;

  Account({
    this.email,
    required this.firstName,
    required this.hasRun,
    required this.isEnabled,
    required this.lastName,
    required this.mobile,
    this.passport,
    this.userRun,
  });

  Account.fromJsonMap(Map<String, dynamic> json) {
    email = json['email'].toString();
    firstName = json['firstName'].toString();
    hasRun =
        bool.fromEnvironment(json['hasRun'].toString(), defaultValue: true);
    isEnabled =
        bool.fromEnvironment(json['isEnabled'].toString(), defaultValue: true);
    lastName = json['lastName'].toString();
    mobile = json['mobile'].toString();
    userRun = json['userRun'].toString();
    passport = json['passport'].toString();
  }

  /*Future<Account> getAccount(String mobile) async {
    CollectionReference accounts =
        FirebaseFirestore.instance.collection('accounts');

    Account currentAccount;

    mobile = '+56 9 9290 0357';

    return currentAccount;
  }
  */
}
