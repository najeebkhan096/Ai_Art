
import 'package:ai_art/Screens/geni_ai_image.dart';
import 'package:ai_art/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PaymentScreen extends StatelessWidget {
static const routename="PaymentScreen";

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

                SizedBox(height: height*0.025,),
                Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.close,color: Colors.white,),
                  Container(
                    height: height*0.056,
                    width: width*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        const Color(0xffE2B6FF),
                       const Color(0xff9B8DFF)
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      ),


                    ),
                  child: Center(
                    child: Text("Restore",
                    style: myStyle.getblackbold(FontWeight.w700, height*0.03),


                    ),
                  )
                      ,
                  )
                ],
              ),
            ),
                SizedBox(height: height*0.025,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text("Geni AI ",
                        style:myStyle.getblack(FontWeight.w700, height*0.043),
                        textAlign: TextAlign.center,
                      ),
                      Text("Pro",
                        style:myStyle.getblackbold(FontWeight.w700, height*0.043),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02,),
                Text("Unleash your creativity with PRO experience ",
                  style:myStyle.getblack(FontWeight.w500, height*0.02),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height*0.025,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/circle.svg"),
                      SizedBox(width: width*0.05,),
                      Text("Remove Ads",
                        style:myStyle.getblack(FontWeight.w500, height*0.022),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/circle.svg"),
                      SizedBox(width: width*0.05,),
                      Text("Unlimited artwork creation",
                        style:myStyle.getblack(FontWeight.w500, height*0.022),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/circle.svg"),
                      SizedBox(width: width*0.05,),
                      Text("Download high resolution artwork",
                        style:myStyle.getblack(FontWeight.w500, height*0.022),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/circle.svg"),
                      SizedBox(width: width*0.05,),
                      Text("50% off on AI Avatars",
                        style:myStyle.getblack(FontWeight.w500, height*0.022),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.05,),
                Container(
                  height: height*0.085,
                  width: width*1,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Color(0xffE2B6FF),
                        Color(0xff9B8DFF)
                      ])
                  ),
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.01,),
                      Text("Auto-renewable",
                        style: myStyle.getblack(FontWeight.w500, height*0.017),
                      ),


                      Text("PKR 650.00, Week",
                        style: myStyle.getwhitebold(FontWeight.w500, height*0.022),
                      ),

                    ],
                  )
                  ,
                ),
                SizedBox(height: height*0.05,),
                Container(
                  height: height*0.085,
                  width: width*1,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),

                  ),
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.01,),
                      Text("Billed Once",
                        style: myStyle.getblack(FontWeight.w500, height*0.018),
                      ),


                      Text("PKR 5300.00,Lifetime",
                        style: myStyle.getblackbold(FontWeight.w500, height*0.023),
                      ),

                    ],
                  )
                  ,
                ),
                SizedBox(height: height*0.05,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(Gen_Ai_ImageScreen.routename);

                  },
                  child: Container(
                    height: height*0.075,
                    width: width*1,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Color(0xff1D282F),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Unlock Wonder Pro",
                          style: myStyle.getwhitebold(FontWeight.w500, height*0.024),
                        ),
            SizedBox(width: width*0.05,),
            Image.asset("images/arrow.png",height: height*0.025,)
                      ],
                    )
                    ,
                  ),
                ),
                SizedBox(height: height*0.025,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Privacy and Terms ",
                        style:  TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins-Regular',
                            fontSize: height*0.022,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text("Cancel anytime",
                        style :  TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins-Regular',
                          fontSize: height*0.022,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline
                      ),textAlign: TextAlign.center,
                      ),
                    ],
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
