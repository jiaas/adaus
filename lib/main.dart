import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Router/ui/pages/router_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'adaus',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RouterPage());
  }
}
