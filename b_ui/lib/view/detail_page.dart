import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> description = [
    "This is simply a tool for identifying vehicles where a road traffic offence has been committed or where criminal activity is suspected  \n\n  መደበኛ የፍጥነት መቀጮን መክፈል ግን በዚህ ደንብ ስር አይወድቅም እና በወንጀል ሪከርድ አያሰጥዎትም. የማነሃሪያ የትራንስፖርት ስርዓት",
    "This includes such things as non-injury crashes, traffic congestion, breakdowns and obstructions on the highway.",
    "Paying a normal speeding fine, however, does not fall under this rule and will not land you with a criminal record."];

  @override
  void initState() {
    super.initState();
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
                              "ID 98765678",
                              style: TextStyle(
                                  color:Color(0xFFfdebb2),
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
                              color:Color(0xFF69c5df),
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
                height: 340,
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
                    margin: const EdgeInsets.only(left: 20,top: 20, bottom: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                            child:Row(
                              children: [
                                Text(
                                  "Surafel",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Expanded(child: Container())
                              ],
                            )
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: width,
                          child: Text(description[0],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Divider(thickness: 0.8,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.watch_later,
                                    color:Color(0xFF69c5df)),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Time",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Color(0xFF303030),
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    Text("Aug 22",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Color(0xFFacacac)
                                      ),
                                    )
                                  ],
                                )
                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.monetization_on,
                                    color:Color(0xFFfb8483)),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Payed Fine",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Color(0xFF303030),
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    Text("300 dollar",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Color(0xFFacacac)
                                      ),
                                    )
                                  ],
                                )
                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star,
                                    color:Color(0xFFfbc33e)),
                                SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Ratting",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Color(0xFF303030),
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    Text("4.5",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Color(0xFFacacac)
                                      ),
                                    )
                                  ],
                                )
                              ],)
                          ],
                        )
                      ],
                    ),

                  ),
                ),
              ),
              Positioned(
                  top: 530,
                  left: 0,

                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ማስጠንቀቂያ : 2 ጊዜ",style: TextStyle(fontSize:18,fontWeight: FontWeight.w300),),
                        Text("ቅጣት : 0 ጊዜ",style: TextStyle(fontSize:18,fontWeight: FontWeight.w300),),
                        Text("ፈቃድ : atr/****/09",style: TextStyle(fontSize:18,fontWeight: FontWeight.w300)),
                        Text("ዓይነት : criminal history",style: TextStyle(fontSize:18,fontWeight: FontWeight.w300)),
                ],
              ),
                  ))
              //))
            ],
          ),
        ),

      );


  }
}