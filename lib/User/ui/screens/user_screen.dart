import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController hasRunController;
  late TextEditingController isEnabledController;
  late TextEditingController lastNameController;
  late TextEditingController mobileController;
  late TextEditingController passportController;
  late TextEditingController userRunController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
        ),
        TextField(
          controller: firstNameController,
        ),
        TextField(
          controller: hasRunController,
        ),
        TextField(
          controller: isEnabledController,
        ),
        TextField(
          controller: lastNameController,
        ),
        TextField(
          controller: mobileController,
        ),
        TextField(
          controller: passportController,
        ),
        TextField(
          controller: userRunController,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Confirmar',
          ),
        )
      ],
    );
  }
}
