import 'dart:async';

import 'package:ai_art/Screens/Payment.dart';
import 'package:ai_art/widgets.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 3), ()=>Navigator.of(context).pushNamed(PaymentScreen.routename));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Container(

        width: width*1,

        child: Stack(

          fit: StackFit.expand,

          children: [

            Image.asset("images/bg.png",fit: BoxFit.fill,),

           Column(

             mainAxisAlignment: MainAxisAlignment.start,

             children: [

               SizedBox(height: height*0.16,),

               Container(
                 margin: EdgeInsets.only(left: 20,right: 20),
                 child: Wrap(
                   alignment: WrapAlignment.center,
                   children: [
                     Text("Turn your words into ",
                       style:myStyle.getblack(FontWeight.w700, height*0.048),
                       textAlign: TextAlign.center,
                     ),
                     Text("Artwork",
                       style:myStyle.getblackbold(FontWeight.w700, height*0.048),
                       textAlign: TextAlign.center,
                     ),
                   ],
                 ),
               ),
               SizedBox(height: height*0.05,),
               Image.asset("images/pic1.png",height: height*0.5,)

             ],
           )
          ],
        ),
      ),
      
    );
  }
}
