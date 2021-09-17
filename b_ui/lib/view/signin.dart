import 'package:b_ui/controllers/signin_controller.dart';
import 'package:b_ui/view/my_home.dart';
import 'package:b_ui/view/show_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _usernameController =  TextEditingController();
  TextEditingController _passwordController =  TextEditingController();

  var formkey;
  SignInController validater = Get.put(SignInController());

  @override
  void initState() {
    super.initState();
    formkey = GlobalKey<FormState>();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(left: 40,right: 40,top: 80),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome",style: TextStyle(
                              fontSize: 50, color: Colors.black,fontFamily: 'indie',fontWeight: FontWeight.bold,
                              letterSpacing: 2
                          ),),
                          Text("  To Traffic Application!",style: TextStyle(
                              fontSize: 14, color: Colors.black,fontFamily: 'indie',fontWeight: FontWeight.w300
                          ),),
                        ],
                      ),
                      CircleAvatar(child:Icon(Icons.location_on_outlined,size: 40,color: Colors.white,),radius: 30,backgroundColor: Color(0xFF363f96),),
                    ],
                  ),
                  SizedBox(height: height*0.1,),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Enter your username",
                      labelStyle:TextStyle(
                        fontFamily: 'indie',
                      fontWeight: FontWeight.w300),
                      icon: Icon(Icons.location_history_outlined,size: 18,),),
                    validator: (value){
                      return validater.validateUserName(value);
                    },
                  ),
                  SizedBox(height: height*0.05,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Enter your Password",
                        labelStyle: TextStyle(
                          fontFamily: 'indie',
                          fontWeight: FontWeight.w300
                        ),
                        icon: Icon(Icons.vpn_key_outlined,size: 18,)),
                    validator: (password){
                      return validater.validatePassword(password);
                    },
                  ),
                  SizedBox(height: height*0.03,),
                  Row(
                    children: [
                      Expanded(child: SizedBox(width: 5,)),
                      Text("Forget Password?"),
                    ],
                  ),
                  SizedBox(height: height*0.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sign In",style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'indie',
                        color: Color(0xFF363f96)
                      ),),
                      MaterialButton(
                          color: Color(0xFF363f96),
                          elevation: 10,
                          onPressed: (){
                            // String username = _usernameController.text;
                            // String password = _passwordController.text;
                            // print(validater.signInMethod(username, password));
                            // if(validater.signInMethod(username, password)=="account")
                            // {
                            //   Get.to(()=>MyHomePage());
                            // }else if(validater.signInMethod(username, password)=="no_account")
                            // {
                            //   Get.to(()=>ShowAll());
                            // }
                            //
                            // print('login attempt: $username with $password');
                            if(formkey.currentState.validate()){
                              Get.to(()=>MyHomePage());
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('InValid Inputs',)));
                            }
                          },
                          child: Icon(Icons.arrow_forward,size: 30,color: Colors.white,)),
                    ],
                  )
                ],
              ),
            )
        ),
      ),

    );
  }
}
