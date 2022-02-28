// ignore_for_file: avoid_unnecessary_containers, unused_element, prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, sized_box_for_whitespace

import 'package:flutter/material.dart';

class FoodPageScroll extends StatefulWidget {
  const FoodPageScroll({ Key? key }) : super(key: key);

  @override
  State<FoodPageScroll> createState() => _FoodPageScrollState();
}

class _FoodPageScrollState extends State<FoodPageScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height:320,
      child: PageView.builder(
        itemCount:5,
        itemBuilder:(context,position){
        return _buildpageIteam(position);
      }), 
    );
  }
 Widget _buildpageIteam(int index)
 {
   return Stack(
     children: [
           Container(
                height: 220,
                margin: EdgeInsets.only(left:5,right: 5),
               decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
               color:index.isEven? Color.fromARGB(255, 72, 170, 197):Color.fromARGB(255,200,100,91),
               image: DecorationImage(
                 fit: BoxFit.cover,
                 image:AssetImage(
                 "assets/images/food0.png"
               ))
         ),    
           )
   ],);
 }
}