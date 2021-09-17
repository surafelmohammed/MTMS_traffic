import 'package:b_ui/view/fine_driver.dart';
import 'package:b_ui/view/my_home.dart';
import 'package:b_ui/view/show_all.dart';
import 'package:b_ui/view/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';



class SignInController{

  Future<String> signInMethod(String traffic_id, String password) async {

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
        Get.to(()=>MyHomePage());
      }else{
        Get.to(()=>FineDriver());
      }
    } else {
      Get.to(()=>ShowAll());// Toast
    }
  }


  String validateUserName(value){

    if(value.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
      return "please Insert the valid username";
    }else{
      return null;
    }
  }
  String validatePassword(password){

    if(password.isEmpty||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)){
      return "Please Insert valid and strong password";
    }else{
      return null;
    }
  }
}