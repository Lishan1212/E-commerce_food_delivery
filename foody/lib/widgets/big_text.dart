// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foody/utills/dimentions.dart';

class BigText extends StatelessWidget {
 Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({Key? key, this.color=const Color(0xFF332d2b) ,
  this.size=20.0,
  required this.text,
  this. overflow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( 
      text,
      maxLines: 1,
      overflow: overflow ,
     style: TextStyle(color: color,
     fontFamily: 'Roboto',
     fontWeight: FontWeight.w600,
     fontSize: Dimentions.font20
     ),
    );
  }
}