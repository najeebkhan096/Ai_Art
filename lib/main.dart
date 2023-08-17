import 'package:ai_art/Screens/Payment.dart';
import 'package:ai_art/Screens/ai_image.dart';
import 'package:ai_art/Screens/eraseimage.dart';
import 'package:ai_art/Screens/geni_ai_image.dart';
import 'package:ai_art/Screens/home.dart';

import 'package:ai_art/Screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaskImageScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'PaymentScreen':(context)=>PaymentScreen(),
        'Ai_ImageScreen':(context)=>Ai_ImageScreen(),
        'Gen_Ai_ImageScreen':(context)=>Gen_Ai_ImageScreen(),
        'HomeScreen':(context)=>HomeScreen()
      },
    );

  }
}
