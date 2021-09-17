import 'package:b_ui/view/detail_page.dart';
import 'package:b_ui/view/fine_driver.dart';
import 'package:b_ui/view/login.dart';
import 'package:b_ui/view/report_page.dart';
import 'package:b_ui/view/signin.dart';
import 'package:b_ui/view/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'view/my_home.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: ()=>MyHomePage()),
        GetPage(name: '/users', page: ()=>Users()),
        GetPage(name: '/detail', page: ()=>DetailPage()),
        GetPage(name: "/report", page: ()=>ReportPage()),
        GetPage(name: '/signin', page: ()=>SignIn()),
        GetPage(name: '/fine', page: ()=>FineDriver())
      ],

      home: Scaffold(
        body: SignIn(),
      ),
    );
  }
}

