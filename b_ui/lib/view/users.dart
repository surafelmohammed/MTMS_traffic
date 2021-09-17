
import 'package:b_ui/controllers/product_controller.dart';
import 'package:b_ui/view/shimmer_user.dart';
import 'package:b_ui/widgets/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class Users extends StatefulWidget {

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child:   Column(
        children: [
          SearchContainer(),
          SizedBox(height: 5,),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                  // child: SkeletonUser(),
                  child: Obx((){
                    try{
                      if (productController.productList[0].imageLink.isNotEmpty) {
                        print("a");
                        return ListView.builder(
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () =>
                                  Get.toNamed('/detail', arguments: {
                                    'image': productController
                                        .productList[index].imageLink,
                                  }),
                              child: Container(
                                height: 200,
                                child: Stack(
                                  children: [
                                    //background cardview
                                    Positioned(
                                      top: 25,
                                      left: width * 0.05,
                                      child: Material(
                                        child: Container(
                                          height: 160,
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(0),
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
                                        left: width * 0.12,
                                        child: Material(
                                          child: Container(
                                            height: 160,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  productController
                                                      .productList[index]
                                                      .imageLink,),
                                              ),
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500,
                                                    offset: Offset(-3, 3),
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
                                        left: width * 0.50,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text("Surafel Mohammed",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF363f93)
                                                ),),
                                              SizedBox(height: 5,),
                                              Text("licence 0987",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300
                                                ),),
                                              SizedBox(height: 10,),
                                              Container(height: 0.5,
                                                width: width * 0.4,
                                                color: Colors.grey,),
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
                              ),
                            );
                          },
                        );
                      }else {
                        print("b");
                        return SkeletonUser();
                      }
                    }catch(e){
                      print("c");
                      return SkeletonUser();

                    }
                  })
              )
          ),
        ],
      )
      ),
    );
  }
}
