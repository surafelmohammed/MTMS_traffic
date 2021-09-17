import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.primaries.last,
        title: Text("Search History"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        height: height,
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(6, (index) {
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
                            image: AssetImage(
                                'assets/wakanda.jpg'
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("ስም  : ማንሃሪያ",style: TextStyle(fontWeight: FontWeight.w300),),
                  Text("ፈቃድ : atr/****/09",style: TextStyle(fontWeight: FontWeight.w300)),
                  Text("ዓይነት : criminal history",style: TextStyle(fontWeight: FontWeight.w300)),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
