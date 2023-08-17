
import 'package:flutter/material.dart';

class MyStyle{
  TextStyle getblack(FontWeight weight,double size){
    return
      TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins-Regular',
        fontSize: size,
        fontWeight: weight,

      )
    ;
  }

  TextStyle getblackbold(FontWeight weight,double size){
    return
      TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins-Bold',
        fontSize: size,
        fontWeight: weight
      )
    ;
  }


  TextStyle getwhite(FontWeight weight,double size){
    return
      TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins-Regular',
        fontSize: size,
        fontWeight: weight,
      )
    ;
  }
  TextStyle getc4c1e2(FontWeight weight,double size){
    return
      TextStyle(
        color: const Color(0xffc4c1e2),
        fontFamily: 'Poppins-Regular',
        fontSize: size,
        fontWeight: weight,
      )
    ;
  }


  TextStyle getwhitebold(FontWeight weight,double size){
    return
      TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins-Bold',
          fontSize: size,
          fontWeight: weight
      )
    ;
  }
  TextStyle get6C6C6C(FontWeight weight,double size){
    return
      TextStyle(
        color: const Color(0xff6C6C6C),
        fontFamily: 'Poppins-Regular',
        fontSize: size,
        fontWeight: weight,

      )
    ;
  }


}
MyStyle myStyle=MyStyle();