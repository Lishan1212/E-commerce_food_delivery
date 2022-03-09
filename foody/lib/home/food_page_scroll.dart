// ignore_for_file: avoid_unnecessary_containers, unused_element, prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, avoid_print, must_call_super, unused_local_variable, unnecessary_new

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foody/utills/dimentions.dart';
import 'package:foody/widgets/big_text.dart';
import 'package:foody/widgets/icons_and_text_widget.dart';
import 'package:foody/widgets/small_text.dart';

import '../utills/colors/colors.dart';

class FoodPageScroll extends StatefulWidget {
  const FoodPageScroll({ Key? key }) : super(key: key);

  @override
  State<FoodPageScroll> createState() => _FoodPageScrollState();
}

class _FoodPageScrollState extends State<FoodPageScroll> {
  PageController pageController =PageController(viewportFraction: 0.85 );
  var _currpageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimentions.pageviewContainer;
   
  @override
  void initState()
  {
    super.initState();
    pageController.addListener(() {
    setState(() {
      _currpageValue=pageController.page!;
      print("Current page value is"+_currpageValue.toString());  
    });
    },);
  }

@override
void dispose()
{
  pageController.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Container(
      //color: Colors.blueGrey,
      height:Dimentions.pageview,
      child: PageView.builder(
        controller: pageController,
        itemCount:5,
        itemBuilder:(context,position){
        return _buildpageIteam(position);
      }), 
    ),
    new DotsIndicator(
  dotsCount: 5,
  position: _currpageValue,
  decorator: DotsDecorator(
    activeColor: Appcolors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
)
    ],
    );
  }
 Widget _buildpageIteam(int index)
 {
   Matrix4 matrix =new Matrix4.identity();
   if(index == _currpageValue.floor()){
     var currentScale =1-(_currpageValue-index)*(1-_scaleFactor);
    var currTans=  _height*(1-currentScale)/2;
   matrix= Matrix4.diagonal3Values(1,currentScale ,1)..setTranslationRaw(0,currTans,0);
   }

   else if(index == _currpageValue.floor()+1)
   {
     var currentScale=_scaleFactor+(_currpageValue-index+1)*(1-_scaleFactor);
    //var currentScale =1-(_currpageValue-index)*(1-_scaleFactor);
    var currTans=  _height*(1-currentScale)/2;
     matrix= Matrix4.diagonal3Values(1,_scaleFactor,1);
     matrix= Matrix4.diagonal3Values(1,currentScale ,1)..setTranslationRaw(0,currTans,0);
   }
  else if(index == _currpageValue.floor()-1)
   {
     //var currentScale=_scaleFactor+(_currpageValue-index+1)*(1-_scaleFactor);
   var currentScale =1-(_currpageValue-index)*(1-_scaleFactor);
    var currTans=  _height*(1-currentScale)/2;
     matrix= Matrix4.diagonal3Values(1,_scaleFactor,1);
     matrix= Matrix4.diagonal3Values(1,currentScale ,1)..setTranslationRaw(0,currTans,0);
   }
   else{
     var _currScale=0.8;
     matrix= Matrix4.diagonal3Values(1,_scaleFactor,1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2,1);
   }
   return Transform(
     transform: matrix,
     child: Stack(
       children: [
             Container(
                  height:Dimentions.pageviewContainer, 
                  margin: EdgeInsets.only(left:Dimentions.width10,right: Dimentions.width10),
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                 color:index.isEven? Color.fromARGB(255, 72, 170, 197):Color.fromARGB(255,200,100,91),
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image:AssetImage(
                   "assets/images/food0.png"
                 ))
           ),    
             ), 
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                    height: Dimentions.pageviewTextController, 
                    margin: EdgeInsets.only(left:30,right:30,bottom:20),
                   decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                   color:Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Color(0xFFe8e8e8),
                       blurRadius: 5.0,
                       offset: Offset(0,6)
                     ),
                     BoxShadow(
                       color: Colors.white10,
                       offset:Offset(-5,0)
                       ),
                       BoxShadow(
                       color: Colors.white10,
                       offset:Offset( 5,0)
                       ),

                   ]
                      ),  
                      child: Container(
                        padding:EdgeInsets.only(top:Dimentions.height11,right: 10,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        BigText(text: 'Srilankan kothu'),
                      SizedBox(height:Dimentions.height10),
                      Row(children: [ 
                      Wrap(children: 
                        List.generate(5,(index)=> Icon(Icons.star,color: Appcolors.mainColor,size: 15,))
                      ,),
                      SizedBox(width: 10),
                      SmallText(text: '4.5'),
                       SizedBox(width: 10,),
                       SmallText(text: '1234',),
                       SizedBox(width: 10),
                       SmallText(text: 'comments')
                      ],
                      ),
                      SizedBox(height:Dimentions.height14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        IconsAndTextWidget(icon:Icons.circle_sharp,
                        text:'Normal',
                        iconColor:Appcolors.iconColor1,),
                        IconsAndTextWidget(icon:Icons.location_on,
                        text:'1.2Km',
                        iconColor:Appcolors.mainColor,),
                        IconsAndTextWidget(icon:Icons.access_time_rounded,
                        text:'32min',
                        iconColor:Appcolors.iconColor2,),
                         
                      ],)
                      ]),
                      ),  
               ),
             ),
     ],),
   );
 }
}