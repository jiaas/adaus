import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserName extends StatelessWidget {
  final String mobileNumber;

  GetUserName(this.mobileNumber);

  @override
  Widget build(BuildContext context) {
    CollectionReference accounts =
        FirebaseFirestore.instance.collection('accounts');

    var query = accounts.where("mobile", "==", "+56 9 9290 0357");

    return FutureBuilder<DocumentSnapshot>(
      future: accounts.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['firstName']} ${data['lastName']}");
        }

        return Text("loading");
      },
    );
  }
}
