// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
 Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key, this.color=const Color(0xFF5c524f) ,
  this.size=12.0,
  required this.text,
  this.height=1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( 
      text,
     style: TextStyle(color: color,
     fontFamily: 'Roboto',
     height: height
  
     ),
    );
  }
}