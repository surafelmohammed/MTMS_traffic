import 'dart:convert';
import 'package:b_ui/view/my_home.dart';
import 'package:b_ui/view/show_all.dart';
import 'package:b_ui/view/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    signInMethod(String traffic_id, String password) async {

      String url = "https://damp-coast-22655.herokuapp.com/api/login-tpolice";
      var response = await http.post(url, body: {
        "traffic_id": traffic_id,
        "password": password
      });
      var jsonResponse = null;

      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {

          print(jsonResponse['token']); // for Printing the token

          // Navigator used to enter inside app if the authentication is correct
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage(),
              ),
                  (Route<dynamic> route) => false);
        }else{
          return SignIn();
        }
      } else {
        return ShowAll();// Toast
      }
    }
    signInMethod("123456", "password");
  }
}
