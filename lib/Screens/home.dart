import 'dart:convert';

import 'package:ai_art/Screens/results.dart';
import 'package:ai_art/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  static const routename="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List<Map<String,dynamic>> mystyles=[
  {
    'title':'3D Reader',
    'image':'icons/3d-cube.png',
    'status':false
  },
  {
    'title':'Abstract',
    'image':'icons/abstract-shape.png',
    'status':false
  }, {
    'title':'Anime',
    'image':'icons/anime.png',
    'status':false
  }, {
    'title':'Cartoon',
    'image':'icons/cartoon.png',
    'status':false
  }, {
    'title':'Digital Art',
    'image':'icons/digital-art.png'
    ,
    'status':false
  }, {
    'title':'illustration',
    'image':'icons/illustration.png'
    ,
    'status':false
  }, {
    'title':'Origami',
    'image':'icons/origami.png'
    ,
    'status':false
  }, {
    'title':'Pixel Art',
    'image':'icons/pixel art.png'
    ,
    'status':false
  }, {
    'title':'Photography',
    'image':'icons/photography.png'
    ,
    'status':false
  }, {
    'title':'Pop art',
    'image':'icons/pop art.png'
    ,
    'status':false
  }, {
    'title':'Retro',
    'image':'icons/retro.png'
    ,
    'status':false
  }, {
    'title':'Sketch',
    'image':'icons/sketch.png'
    ,
    'status':false
  }, {
    'title':'Vaporware',
    'image':'icons/vaporware.png'
    ,
    'status':false
  },
];
String ? selectstyle='';
String ? selectmedium='';
String ? resolution='';
String ? aspect='';

  List<Map<String,dynamic>> mymedium=[
    {
      'title':'Acrylic',
      'image':'icons/acrylic.png'
      ,
      'status':false
    },
    {
      'title':'Convas',
      'image':'icons/convas.png'
      ,
      'status':false
    }, {
      'title':'Chalk',
      'image':'icons/chalk.png'
      ,
      'status':false
    },  {
      'title':'Crayon',
      'image':'icons/digital-art.png'
      ,
      'status':false
    }, {
      'title':'Glass',
      'image':'icons/glass.png'
      ,
      'status':false
    }, {
      'title':'Ink',
      'image':'icons/ink.png'
      ,
      'status':false
    }, {
      'title':'Pastel',
      'image':'icons/pastel.png'
      ,
      'status':false
    }, {
      'title':'Pencil',
      'image':'icons/pencil.png'
      ,
      'status':false
    },
  ];
  Future<String?> generateImage({required String ? text}) async {

    text=text.toString()+"with style ${selectstyle} "+
        "medium is ${selectmedium}"+
    "having resolution ${resolution}"+
    "aspect ration is ${aspect}"
    ;
    String ? result;
    final apiKey = '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'; // Replace with your OpenAI API key
    final url = 'https://api.openai.com/v1/images/generations';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = {
      "prompt": text,
      "n": 2,
      "size": "1024x1024"
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      final imageUrl = data['data'][0]['url'];
      // Display or process the generated image URL

      result=imageUrl;
      setState(() {
        isloading=false;
      });
    } else {
      setState(() {
        isloading=false;
      });
      print('Error generating image: ${response.statusCode}');

      print(response.body);
    }
    return result;
  }



  bool isloading=false;
TextEditingController controlelr=TextEditingController();
@override
  void dispose() {
    // TODO: implement dispose
  controlelr.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer:  Drawer(
        backgroundColor: Color(0xff151837),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 14,))
,Text("Settings",
                style: myStyle.getwhite(FontWeight.w400, height*0.022),
                )
              ],
            ),
            Container(
              height: height*0.067,
              width: width*1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xfff1b964),
                    Color(0xfff95b38)
                  ],
                  begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset("images/crown.png",height: height*0.025,),
                  SizedBox(width: width*0.025,),
                  Text("ENSOUL PREMIUM",
                    style: myStyle.getwhite(FontWeight.w500, height*0.02),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("COMMUNICTE",
                style: myStyle.getwhitebold(FontWeight.w700, height*0.022),
              ),
            ),
            SizedBox(height: 20,),

            Card(
              margin: EdgeInsets.only(left: 20,right: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Color(0xff3e3c64),
              child: Container(
                width: width*1,

              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    minLeadingWidth: width*0.1,
                    leading: Icon(Icons.star_rate,color: Color(0xffc4c1e2),),
                    title: Text('Rate us',
                    style: myStyle.getc4c1e2(FontWeight.w500, height*0.022),
                    ),
                    onTap: () {
                      // Navigate to the home screen or perform any action
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: width*0.1,
                    leading: Icon(Icons.question_mark,color: Color(0xffc4c1e2),),
                    title: Text('FAQS',
                      style: myStyle.getc4c1e2(FontWeight.w500, height*0.022),
                    ),
                    onTap: () {
                      // Navigate to the home screen or perform any action
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: width*0.1,
                    leading: Icon(Icons.share,color: Color(0xffc4c1e2),),
                    title: Text('Share',
                      style: myStyle.getc4c1e2(FontWeight.w500, height*0.022),
                    ),
                    onTap: () {
                      // Navigate to the home screen or perform any action
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: width*0.1,
                    leading:SvgPicture.asset("images/Group (1).svg",height: height*0.04,color: Color(0xffc4c1e2),),
                    title: Text('Remove Ads',
                      style: myStyle.getc4c1e2(FontWeight.w500, height*0.022),
                    ),
                    onTap: () {
                      // Navigate to the home screen or perform any action
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    dense: true,
                    minLeadingWidth: width*0.1,
                    leading: Icon(Icons.privacy_tip,color: Color(0xffc4c1e2),),
                    title: Text('Privacy Policy',
                      style: myStyle.getc4c1e2(FontWeight.w500, height*0.022),
                    ),
                    onTap: () {
                      // Navigate to the home screen or perform any action
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("RECOMENDED APPS",
                style: myStyle.getwhitebold(FontWeight.w700, height*0.022),
              ),
            ),
            SizedBox(height: 20,),
          ],
        )),
      body: Container(

        width: width*1,

        child: Stack(

          fit: StackFit.expand,

          children: [

            Image.asset("images/bg.png",fit: BoxFit.fill,),

            ListView(


              children: [

                SizedBox(height: height*0.035,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              child: Image.asset("images/menu.png",height: height*0.01,)),
                          SizedBox(width: width*0.05,),
                          Text("Geni AI Image",
                            style:myStyle.getblack(FontWeight.w500, height*0.023),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Image.asset("images/Group 2.png",height: height*0.03,),
SizedBox(width: width*0.025,),
                       SvgPicture.asset("images/gg_profile.svg",height: height*0.03,)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height*0.025,),
Container(
  margin: EdgeInsets.only(right: 20,left: 20),
  child:   Row(
    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
    children: [
          Row(
        children: [
          Container(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [        Color(0xffE2B6FF),
              Color(0xff9B8DFF)],
              ).createShader(bounds),
              child: Text('Add Your Photo',
                style: myStyle.getwhite(FontWeight.w500, height*0.02)
              ),
            ),
          ),
          SizedBox(width: width*0.015,),
          Image.asset("images/add_image.png",height: height*0.02,)

        ],
      ),

      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [        Color(0xffE2B6FF),
                  Color(0xff9B8DFF)],
              ).createShader(bounds),
              child: Text('I need inspiration',
                  style: myStyle.getblack(FontWeight.w500, height*0.02)
              ),
            ),
          ),
          SizedBox(width: width*0.015,),
          Image.asset("images/bulb.png",height: height*0.02,)

        ],
      ),

    ],
  ),
),

                SizedBox(height: height*0.025,),




                Container(
          height: height*0.15,
                  width: width*1,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                   border: Border.all(color:     Color(0xffE2B6FF),width: 2)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
Text("") ,


                      Center(
                        child: Container(

                          alignment: Alignment.center,
                          child: TextField(
                            controller: controlelr,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write any text you want to search',
                              helperStyle: myStyle.getblack(FontWeight.w500, height*0.016),
                            )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10,bottom: 5,left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset("images/ic_outline-refresh.svg"),

                            InkWell(
                                onTap: (){


                                    controlelr.clear();

                                },
                                child: SvgPicture.asset("images/radix-icons_cross-2.svg"))

                          ],
                        ),
                      )
                    ],
                  )
                  ,
                ),
                SizedBox(height: height*0.025,),

                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text("Aspect Ratio:",
                        style: myStyle.getblack(FontWeight.w700, height*0.0165),
                      ),
                  SizedBox(width: width*0.025,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            aspect="1:1";
                          });
                        },
                        child: Container(

                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(left: 20,),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:
                              aspect=="1:1"?
                              Color(0xffE2B6FF):Colors.transparent,width: 2)
                          ),

                          child: Column(
                           children: [
                              Image.asset("images/1_1 1.png",height: height*0.015,),

                            ],
                          )
                          ,
                        ),
                      ),
                     SizedBox(width: width*0.025,),
                      InkWell(
                          onTap: (){
                            setState(() {
                              aspect="2:3";
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color:
                                  aspect=="2:3"?
                                  Color(0xffE2B6FF):Colors.transparent,width: 2)
                              ),

                              child: Image.asset("images/2_3 1.png",height: height*0.015,))),
                      SizedBox(width: width*0.075,),
                      InkWell(
                          onTap: (){
                            setState(() {
                              aspect="3:2";
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color:
                                  aspect=="3:2"?
                                  Color(0xffE2B6FF):Colors.transparent,width: 2)
                              ),

                              child: Image.asset("images/3_2 1.png",height: height*0.015,))),

                    ],
                  ),
                ),
                SizedBox(height: height*0.025,),
                Container(

                  width: width*1,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color(0xffE2B6FF),
                        Color(0xff9B8DFF)
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        height: height*0.07,
                        child: ListView(

                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text("Select  ",
                                style: myStyle.getwhite(FontWeight.w500, height*0.02),
                              ),
                            ),

                            Container(
                              alignment: Alignment.center,
                              child: Text("Style",
                                style: myStyle.getblackbold(FontWeight.w500, height*0.02),
                              ),
                            ),

                            Row(
                              children: List.generate(mystyles.length, (index) =>  InkWell(

                                onTap: (){

                                  setState(() {
                                    selectstyle=mystyles[index]['title'];
                                    for(int i=0;i<mystyles.length;i++){
                                      if(i==index){
                                        setState(() {
                                          mystyles[i]['status']=true;
                                        });
                                      }else{

                                        setState(() {
                                          mystyles[i]['status']=false;
                                        });
                                      }
                                    }
                                  });

                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                          mystyles[index]['status']==true?
                                          Colors.white:Colors.transparent
                                      )
                                  ),
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: width*0.028,
                                        backgroundColor: Color(0xffD9D9D9),
                                        backgroundImage: AssetImage(mystyles[index]['image'],),
                                      ),

                                      Text(mystyles[index]['title'],
                                        style: myStyle.getblack(FontWeight.w500, height*0.012),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            )
                          ],
                        )
                      ),
                      SizedBox(height: height*0.02,),
                      Container(

                          height: height*0.07,
                          child: ListView(

                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text("Medium  ",
                                  style: myStyle.getwhite(FontWeight.w500, height*0.02),
                                ),
                              ),


                              Row(
                                children: List.generate(mymedium.length, (index) =>  InkWell(

                                  onTap: (){

                                    setState(() {
                                      selectstyle=mymedium[index]['title'];
                                      for(int i=0;i<mymedium.length;i++){
                                        if(i==index){
                                          setState(() {
                                            mymedium[i]['status']=true;
                                          });
                                        }else{

                                          setState(() {
                                            mymedium[i]['status']=false;
                                          });
                                        }
                                      }
                                    });

                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                            mymedium[index]['status']==true?
                                            Colors.white:Colors.transparent
                                        )
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: width*0.028,
                                          backgroundColor: Color(0xffD9D9D9),
                                          backgroundImage: AssetImage(mymedium[index]['image'],),
                                        ),

                                        Text(mymedium[index]['title'],
                                          style: myStyle.getblack(FontWeight.w500, height*0.012),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Text('Images',
                              style: myStyle.getwhite(FontWeight.w500, height*0.02)
                          ),

                          SizedBox(width: width*0.025,),

                          CircleAvatar(
                    radius: width*0.021,
                            backgroundColor: Color(0xffD9D9D9),
                          child: Center(
                            child: Text("1",
                            style: myStyle.getblack(FontWeight.w500, height*0.015),
                            ),
                          ),
                          ),
                          SizedBox(width: width*0.01,),

                          CircleAvatar(
                    radius: width*0.021,
                            backgroundColor: Color(0xffD9D9D9),
                            child: Center(
                              child: Text("2",
                                style: myStyle.getblack(FontWeight.w500, height*0.015),
                              ),
                            ),
                          ),

                          SizedBox(width: width*0.01,),

                          CircleAvatar(
                    radius: width*0.021,
                            backgroundColor: Color(0xffD9D9D9),
                            child: Center(
                              child: Text("3",
                                style: myStyle.getblack(FontWeight.w500, height*0.015),
                              ),
                            ),
                          ),

                          SizedBox(width: width*0.01,),

                          CircleAvatar(
                    radius: width*0.021,
                            backgroundColor: Color(0xffD9D9D9),
                            child: Center(
                              child: Text("4",
                                style: myStyle.getblack(FontWeight.w500, height*0.015),
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.02,),
                          Text('Resolution',
                              style: myStyle.getwhite(FontWeight.w500, height*0.015)
                          ),
                          SizedBox(width: width*0.015,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                resolution="small";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color:
                                resolution=="small"?
                                Colors.white:Colors.transparent)
                              ),
                              child: Text('Small',
                                  style: myStyle.getblack(FontWeight.w500, height*0.013)
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.015,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                resolution="medium";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color:
                                  resolution=="medium"?
                                  Colors.white:Colors.transparent)
                              ),
                              child: Text('Medium',
                                  style: myStyle.getblack(FontWeight.w500, height*0.013)
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.015,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                resolution="large";
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color:
                                  resolution=="large"?
                                  Colors.white:Colors.transparent)
                              ),
                              child: Text('Large',
                                  style: myStyle.getblack(FontWeight.w500, height*0.013)
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  )
                  ,
                ),
                SizedBox(height: height*0.025,),
isloading?
    SpinKitCircle(color: Colors.black,)
    :
                InkWell(
                  onTap: ()async{
                    setState(() {
                      isloading=true;
                    });
                    final result=await generateImage(text: controlelr.text);

                   if(result!=null){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context){
                         return ResultScreen(url: result,);
                       })
                     );
                   }


                  },
                  child: Container(

                    width: width*1,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color(0xffE2B6FF),
                          Color(0xff9B8DFF)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                    ),
                    padding: EdgeInsets.only(left: 20,bottom: 10,top: 10,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("images/bi_badge-ad-fill (1).svg"),

                        Column(
                          children: [
                            Text("Create",
                            style: myStyle.getwhitebold(FontWeight.w700, height*0.025),
                            ),
                            Text("Watch an Ad",
                              style: myStyle.getwhite(FontWeight.w500, height*0.025),
                            ),

                          ],
                        ),

                        SvgPicture.asset("images/farward.svg")

                      ],
                    )
                      ],
                    )
                    ,
                  ),
                ),
                SizedBox(height: height*0.025,),
                Container(
                    margin:EdgeInsets.only(left: 20,right: 20),child: Image.asset("images/Group 3.png"))

,
                SizedBox(height: height*0.025,),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text("Discover",
                              style: myStyle.getblack(FontWeight.w500, height*0.026),
                            ),

                            Text("Artworks",
                              style: myStyle.getblackbold(FontWeight.w500, height*0.026),
                            ),
                          ],
                        ),
                      ),

                      Icon(Icons.search,color: Colors.black,)

                    ],
                  ),
                ),
                SizedBox(height: height*0.025,),
                Container(

                  width: width*1,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color(0xffE2B6FF),
                        Color(0xff9B8DFF)
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      padding: EdgeInsets.only(left: 20,bottom: 10,top: 5,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Editor choice",
                          style:TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins-Regular',
                            fontSize: height*0.018,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline
                          )
                          ),

                          Text("Top ArtWorks",
                              style:TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Regular',
                                fontSize: height*0.018,
                                fontWeight: FontWeight.w500,
                              )
                          ),

                          Text("Recent ArtWorks",
                              style:TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Regular',
                                fontSize: height*0.018,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                        ],
                      ),
                    ),
                      SizedBox(height: height*0.025,),
                      BuildTryAnimation(context, "images/Rectangle 24.png")
                      ,SizedBox(height: height*0.05,),

                      BuildTryAnimation(context, "images/Rectangle 26.png")
                      ,SizedBox(height: height*0.05,),



                      BuildTryAnimation(context, "images/Rectangle 29.png")
                      ,SizedBox(height: height*0.05,),


                      BuildTryAnimation(context, "images/Rectangle 32.png")
                      ,SizedBox(height: height*0.05,),


                    ],
                  )
                  ,
                ),

                SizedBox(height: height*0.05,),


              ],
            )
          ],
        ),
      ),
    );
  }

  Widget BuildTryAnimation(BuildContext context, String image){
    return Container(
      width: MediaQuery.of(context).size.width*1,
      margin: EdgeInsets.only(left: 10,right: 10),
      height: MediaQuery.of(context).size.height*0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20,),
            bottomRight: Radius.circular(20)
            ),
              color: Colors.black.withOpacity(0.7)
            ),
          padding: EdgeInsets.only(left: 10,right: 10,top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Character Name",
              style: myStyle.getwhite(FontWeight.w700, 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                      style: myStyle.getwhite(FontWeight.w400, 6.5),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(context: context,

                          barrierDismissible: true,

                          builder: (ctx){

                        final width=MediaQuery.of(context).size.width;
                        final height=MediaQuery.of(context).size.height;
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content:  Container(
                            height: height*0.6,
                            width: width*1,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color(0xffE2B6FF),
                                  Color(0xff9B8DFF)
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                )
                            ),
                            padding: EdgeInsets.only(top: 10),

                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.close,color: Colors.black,)),
                                ),
                                Center(child: Image.asset("images/pic4.png",height: height*0.2,))
                           ,
                           SizedBox(height: height*0.025,),

                                Text("Get images",
                                style: myStyle.getwhitebold(FontWeight.w500, height*0.028),
                                ),
                                SizedBox(height: height*0.01,),

                                Container(
                                  margin: EdgeInsets.only(left: 20,right: 20),
                                  child: Text("Lets watch one video ad to earn on more image",
                                    style: myStyle.getblack(FontWeight.w500, height*0.02),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                SizedBox(height: height*0.025,),

                                Container(
                                  height: height*0.067,
                                  width: width*1,
                                  decoration: BoxDecoration(
                                   color: Color(0xff1BA96E),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: EdgeInsets.only(left: 20,right: 20),
                                child: Row(
                                  children: [
                                    SizedBox(width: width*0.025,),
                                    Image.asset("images/crown.png",height: height*0.025,),
                                    SizedBox(width: width*0.025,),
                                    Text("Get Unlimited Images",
                                    style: myStyle.getwhite(FontWeight.w500, height*0.02),
                                    )
                                  ],
                                ),
                                ),

                                SizedBox(height: height*0.025,),

                                Container(
                                  height: height*0.067,
                                  width: width*1,
                                  decoration: BoxDecoration(
                                      color: Color(0xff1E292F),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  margin: EdgeInsets.only(left: 20,right: 20),
                                  child: Row(
                                    children: [
                                      SizedBox(width: width*0.05,),
                                      SvgPicture.asset("images/Group (1).svg",height: height*0.025,),
                                      SizedBox(width: width*0.05,),
                                      Text("Lets Create",
                                        style: myStyle.getwhite(FontWeight.w500, height*0.02),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffD9D9D9)
                      ),
                        padding: EdgeInsets.only(left: 17,right: 17,top: 3,bottom: 3),
                        child: Text("Try",
                      style: myStyle.getblack(FontWeight.w600, 10),
                    )),
                  )
                ],
              ),

            ],
          ),
          ),
        ],
      ),
    );
  }
}
