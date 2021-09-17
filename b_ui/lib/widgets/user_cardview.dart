import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class UserCardView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      child: Stack(
        children: [
          //background cardview
          Positioned(
            top: 25,
            left: width*0.05,
            child: Material(
              child: Container(
                height: 160,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(-5.0, 5.0),
                        blurRadius: 10,
                        spreadRadius: 4,
                      )
                    ]
                ),
              ),
            ),
          ),
          //user image view
          Positioned(
              left: width*0.12,
              child: Material(
                child: Container(
                  height: 160,
                  width: width*0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit:BoxFit.fill,
                      image: AssetImage('assets/wakanda.jpg'),
                    ),
                    color: Color(0xFF363f93),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color:Colors.grey.shade500,
                          offset: Offset(-3,3),
                          blurRadius: 10,
                          spreadRadius: 4
                      )
                    ],
                  ),
                ),
              )
          ),
          //detail information
          Positioned(
              top: 40,
              left: width*0.50,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Surafel Mohammed",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF363f93)
                    ),),
                    SizedBox(height: 5,),
                    Text("licence 0987",style: TextStyle(
                        fontWeight: FontWeight.w300
                    ),),
                    SizedBox(height: 10,),
                    Container(height: 0.5, width: width*0.4,color: Colors.grey,),
                    SizedBox(height: 5,),
                    SizedBox(height: 5,),
                    Text("Phone: +251 925688735"),
                    SizedBox(height: 5,),
                    Text("ID: ATR/1225/09"),
                    SizedBox(height: 5,),
                    Text("WorkPlace: Addis Ababa"),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                      ],
                    )

                  ],
                ),
              ))
        ],
      ),
    );
  }

}