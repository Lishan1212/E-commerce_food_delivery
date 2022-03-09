// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, avoid_web_libraries_in_flutter, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:foody/home/food_page_scroll.dart';
import 'package:foody/widgets/big_text.dart';
import 'package:foody/widgets/small_text.dart';

import '../utills/colors/colors.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("curent height is:"+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
        Container(
          margin: EdgeInsets.only(top:45,bottom: 15),
          padding: EdgeInsets.all(20.0),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
          Column(children: [
           BigText(text:'Sri lanka',color: Color.fromARGB(255, 158, 101, 82),size:36,),
            Row(children: [
              SmallText(text: 'city',color:Color.fromARGB(255, 63, 43, 37),size: 20,),
              Icon(Icons.arrow_drop_down)
            ],)
          ],),
          Center(
            child: Container(
            width: 45,
            height: 45,
            child: Icon(Icons.search,color: Colors.white,),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Appcolors.mainColor
            )
            ,),
          )
        ]),
      ),
      FoodPageScroll()
      ],
      )
    );
  }
}