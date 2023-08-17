import 'package:ai_art/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class ResultScreen extends StatelessWidget {
  final String ? url;
  ResultScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_outlined,color: Colors.black,)),

              Row(
                children: [
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.black,width: 2)
  ),
  padding: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
child: Row(
  children: [
    Icon(Icons.shopping_basket_outlined,color: Colors.black,size: 18,),
    SizedBox(width: 10,),
    Text("PRO",style: myStyle.getblack(FontWeight.w700, height*0.022),)
  ],
),
),
                  SizedBox(width: 10,),

                  Container(
                    height: height*0.06,
                    width: width*0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                     color: Colors.black
                    ),
                    padding: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                    child: Center(child: Text("Done",style: myStyle.getwhite(FontWeight.w700, height*0.022),)),
                  ),

                ],
              )
                ],
              )),
          SizedBox(height: 20,),
          Container(
            height: height*0.4,
            width: width*1,
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: url!,
              placeholder: (context, url) => SpinKitCircle(
                color: Colors.black,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

          ),
          SizedBox(height: 20,),
          Container(
            height: height*0.067,
            width: width*1,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffd712ff),
                  Color(0xff5626fb)
                ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("REMOVE WATERMARK",
                  style: myStyle.getwhite(FontWeight.w500, height*0.02),
                ),
                SizedBox(width: width*0.025,),
                Icon(Icons.keyboard_arrow_up,color: Colors.white,)
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 5,right: 20),
            child:
            const Wrap(
              children: [
                 Text("Share ",
                style: TextStyle(
                  color: Color(0xff9d5bd1),
                  fontWeight: FontWeight.w700
                ),
                ),
                 Text("your Art with the world",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                ),
                  ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/768px-Instagram_icon.png",
                width: width*0.17,
                  height: height*0.06,
                  fit: BoxFit.fill,

                ),
                Image.network("https://cdn.icon-icons.com/icons2/3658/PNG/512/meta_fb_communication_social_media_katana_facebook_icon_228415.png" ,
                  width: width*0.17,
                  height: height*0.06,
                  fit: BoxFit.fill,
                ),
                Image.network("https://static.vecteezy.com/system/resources/previews/002/432/911/original/social-media-snapchat-original-latest-logo-free-vector.jpg",
                  width: width*0.17,
                  height: height*0.06,
                  fit: BoxFit.fill,
                ),
                Image.network("https://png.pngtree.com/png-vector/20230225/ourmid/pngtree-whatsapp-icon-social-media-png-image_6618452.png",
                  width: width*0.17,
                  height: height*0.06,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            height: height*0.067,
            width: width*1,
            decoration: BoxDecoration(
             color: const Color(0xff121212),
                borderRadius: BorderRadius.circular(10)
            ),
            margin:const  EdgeInsets.only(left: 20,right: 20),
            child: Center(
              child: Text("Close",
                style: myStyle.getwhite(FontWeight.w500, height*0.02),
              ),
            ),
          ),
        ],

      ),
    );
  }
}
