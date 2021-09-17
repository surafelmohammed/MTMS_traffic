import 'package:b_ui/controllers/product_controller.dart';
import 'package:b_ui/view/shimmer.dart';
import 'package:b_ui/widgets/history_container.dart';
import 'package:b_ui/widgets/traffic_cardview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          child: Column(
            children: [
              TrafficCardView(),
              HistoryContainer(),
              SizedBox(height: 5,),
              Container(
            height: height*0.5,

                child: Obx((){
                  try{
                    if (productController.isLoading.value) {
                      print("d ${productController.productList[0].imageLink}");
                      return SkeletonHome();
                    }else{
                      print("f ${productController.productList[0].imageLink}");
                      return GridView.count(
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(8, (index) {
                          return Container(
                            height: 220,
                            margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey.shade300,
                                      offset: Offset(2,2),
                                      blurRadius: 2,spreadRadius: 2
                                  )
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              productController.productList[index].imageLink),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("ስም  : ማንሃሪያ",style: TextStyle(fontWeight: FontWeight.w300),),
                                      Text("ፈቃድ : atr/****/09",style: TextStyle(fontWeight: FontWeight.w300)),
                                      Text("ዓይነት : criminal history",style: TextStyle(fontWeight: FontWeight.w300)),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          );
                        }),
                      );
                    }
                  }catch(e)
                  {
                    return SkeletonHome();
                  }

                  }
                ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
