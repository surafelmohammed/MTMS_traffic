import 'dart:convert';
import 'package:b_ui/controllers/reportpage_controller.dart';
import 'package:b_ui/controllers/signin_controller.dart';
import 'package:b_ui/view/fine_driver.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_home.dart';

class ReportPage extends StatefulWidget {

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  var formkey;
  ReportPageController validater = Get.put(ReportPageController());
  void selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    formkey = GlobalKey<FormState>();

  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex  = 0;
    return
      Scaffold(
        body: Container(
          color: Color(0xFF363f96),
          child: Stack(
            children: [
              Positioned(top:25, left:10,child: IconButton(
                onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              )),
              Positioned(
                top: 70,
                left: 0,
                height:80,
                width: width,
                child: Container(
                  width: width,
                  height: 100,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:Color(0xFFebf8fd),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:30,
                          backgroundImage: AssetImage("assets/wakanda.jpg"
                            // Get.arguments['image']
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Surafel Mohammed",
                              style: TextStyle(
                                  color:Color(0xFF3b3f42),
                                  fontSize: 18,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Top Level",
                              style: TextStyle(
                                  color:Colors.orange,
                                  fontSize: 12,
                                  decoration: TextDecoration.none
                              ),
                            ),

                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Color(0xFFf3fafc)
                          ),
                          child: Center(
                            child: Icon(
                              Icons.notifications,
                              color:Color(0xFF363f96),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                width: width,
                height: height,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Color(0xFFf9fbfc),

                ),
              ),
              Positioned(
                top: 180,
                left:0,
                width: width,
                height: 450,
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  width:width,
                  height:250,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFfcfffe),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: Offset(0, 10),
                            color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20,top: 10, right: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: selectTime,
                                  child: Text('SELECT TIME'),
                                ),
                                SizedBox(width: 12),
                                Text('Time: ${_time.format(context)}',
                                  style: TextStyle(
                                      fontSize: 18
                                  ),),
                              ],
                            ),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "ID",
                                fillColor: Color(0xFFf3fafc),
                                filled: true,
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
                              ),
                                validator: (value){
                                return validater.validateID(value);
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Licence",
                                    fillColor: Color(0xFFf3fafc),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
                                  ),
                              validator: (value){
                                return validater.validateLicence(value);
                              },
                                ),
                            SizedBox(height: 10,),
                            TextFormField(
                              maxLines: 7,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Reason",
                                fillColor: Color(0xFFf3fafc),
                                filled: true,
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.1)),
                              ),
                              validator: (value){
                                return validater.validateReason(value);
                              },
                            ),
                            SizedBox(height: 2,),
                            ElevatedButton(
                              onPressed: (){

                                if(formkey.currentState.validate()){
                                  Get.to(()=>MyHomePage());
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('InValid Inputs',)));
                                }
                              },
                              child: Text("Report",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ),
              ),

              //))
            ],
          ),
        ),

      );


  }
}