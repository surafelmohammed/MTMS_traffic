import 'package:b_ui/view/history_page.dart';
import 'package:b_ui/view/show_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 80,
      width: MediaQuery.of(context).size.width*0.88,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey,width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-1.0, 1.0),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            child: GestureDetector(
              onTap: (){
                Get.to(()=>HistoryPage());
                print("what is happing");
              },
              child: Row(
                children: [
                  Icon(Icons.history_outlined,size: 30,color: Color(0xFF363f96)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("30",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text(
                        "History",
                        style: TextStyle(
                            color:Color(0xFF1f2326),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(child: Container()),
          Container(
            height: 65,
            width: 0.3,
            color: Colors.grey,
          ),
          Expanded(child: Container()),
          Text(
            "Show all",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.none
            ),
          ),
          SizedBox(width: 5,),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey,width: 0.2),

            ),
            child: GestureDetector(
              onTap: (){
                Get.to(()=>ShowAll());
                print("whf");
              },
              child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
            ),
          )
        ],
      ),
    );
  }

}