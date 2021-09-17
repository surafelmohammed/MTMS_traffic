import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ShowAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Check Driver","Fine Driver","Report a Driver","Criminal Records"];
    List<String> description = [
      "This is simply a tool for identifying vehicles where a road traffic offence has been committed or where criminal activity is suspected",
      "Traffic violations can result in expensive tickets, higher insurance rates, and possibly suspension of your driver's license",
      "This includes such things as non-injury crashes, traffic congestion, breakdowns and obstructions on the highway.",
      "Paying a normal speeding fine, however, does not fall under this rule and will not land you with a criminal record."];
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Roles"),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
        height: height,
        child: ListView.builder(
            controller: PageController(viewportFraction: 0.88),
            itemCount: 4,
            itemBuilder: (_, i){
              return GestureDetector(
                onTap:(){
                  if(titles[i]=='Check Driver') {
                    Get.toNamed('/users');
                  }else if(titles[i]=='Fine Driver') {
                    Get.toNamed('/fine');
                  } else if(titles[i]=='Report a Driver') {
                    Get.toNamed('/report');
                  } else if(titles[i]=='Criminal Records') {
                    Get.toNamed('/users');
                  }else{
                  }

                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,top: 25,bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, top: 20,right: 15),
                    height: 200,
                    width: width*0.93,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:i.isEven?Color(0xFF363f96):Color(0xFF9294cc),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade400,
                              offset: Offset(-10,5),
                              blurRadius: 5,spreadRadius: 3
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Container(
                            child:Row(
                              children: [
                                Text(
                                  titles[i],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.white
                                  ),
                                ),
                                Expanded(child: Container())
                              ],
                            )
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: width,
                          child: Text(
                            description[i],
                            style: TextStyle(
                                fontSize: 18,
                                color:Color(0xFFb8eefc),
                              fontWeight: FontWeight.w200
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Divider(thickness: 0.3,endIndent: 15,color: Colors.white,),
                        Row(
                            children:[for(int i=0; i<4; i++)
                              Container(
                                width: 45,
                                height: 45,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/wakanda.jpg'
                                          ),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              )]
                        ),],
                    ),
                  ),
                ),
              );
            }),
      ),
    ) ;
  }
}
