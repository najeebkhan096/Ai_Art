import 'package:ai_art/Screens/home.dart';
import 'package:ai_art/widgets.dart';
import 'package:flutter/material.dart';

class Ai_ImageScreen extends StatelessWidget {
  static const routename="Ai_ImageScreen";

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(

        width: width*1,

        child: Stack(

          fit: StackFit.expand,

          children: [

            Image.asset("images/bg.png",fit: BoxFit.fill,),

            ListView(


              children: [

                SizedBox(height: height*0.035,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("images/back.png",width: width*0.075,),
                        SizedBox(width: width*0.2,),
                        Text("AI Image",
                          style:myStyle.getblack(FontWeight.w500, height*0.031),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  ),
                ),



                SizedBox(height: height*0.05,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    height: height*0.45,
                    width: width*1,
                    decoration: BoxDecoration(
                        image: DecorationImage(image:
                        AssetImage("images/collage 1.png"),
                            fit: BoxFit.fill
                        )
                    ),
                  child: Center(child: Image.asset("images/top icon 1.png",
                  height: height*0.325,
                  ))
                  ),
                ),
                SizedBox(height: height*0.025,),
                Container(
                  height: height*0.1,
                  width: width*1,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Color(0xffE2B6FF),
                        Color(0xff9B8DFF)
                      ],
                      begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      ),
                  ),
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Welcome to the ",
                        style: myStyle.getblack(FontWeight.w700, height*0.02),
                      ),


                      Text("AI Avatar !",
                        style: myStyle.getwhitebold(FontWeight.w500, height*0.027),
                      ),

                    ],
                  )
                  ,
                ),
                SizedBox(height: height*0.02,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Discover unlimited variations of yourself and create unique avatars ",
                    style: myStyle.getblack(FontWeight.w400, height*0.023),
                  ),
                ),
                SizedBox(height: height*0.05,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(HomeScreen.routename);

                  },
                  child: Container(
                    height: height*0.08,
                    width: width*1,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Color(0xff1D282F),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Try Now",
                          style: myStyle.getwhitebold(FontWeight.w500, height*0.026),
                        ),

                      ],
                    )
                    ,
                  ),
                ),
                SizedBox(height: height*0.05,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
