import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


class SearchContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
          border: Border.all(width: 0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(-5.0, 5.0),
              blurRadius: 10,
              spreadRadius: 4,
            )
          ],
          color: Colors.grey[400]
      ),
      child: Stack(
        children: [
          //search bar
          Positioned(
              top:25,
              left: 0,
              child: Container(
                height: 35,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    ),
                    border: Border.all(width: 0.3),
                    color: Colors.white
                ),
              )
          ),
          Positioned(
              top: 20,
              left: 10,
              width: 290,
              child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search,size: 30,color: Color(0xFF363f93),),
                hintText: "Search",
                hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 18,color: Color(0xFF363f93)),
                border: InputBorder.none,
              ),
              ))
        ],
      ),
    );
  }

}