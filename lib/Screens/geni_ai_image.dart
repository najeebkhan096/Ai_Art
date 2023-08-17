import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'package:ai_art/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class Gen_Ai_ImageScreen extends StatefulWidget {
  static const routename="Gen_Ai_ImageScreen";

  @override
  State<Gen_Ai_ImageScreen> createState() => _Gen_Ai_ImageScreenState();
}

class _Gen_Ai_ImageScreenState extends State<Gen_Ai_ImageScreen> {

  bool isloading=false;
   File ? imageFile ;
  Future<File?> _pickimage() async{
    File ? choosedfile;
    await  showDialog(
        context: context,
        builder: (ctx) => AlertDialog(

            content: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: () async{
                      await  getfilename(1).then((value) async {
                        choosedfile=value;
                        Navigator.pop(context,value);
                      });
                    },
                    leading: Icon(
                      Icons.camera,

                    ),
                    title: Text( "Camera", ),
                  ),
                  ListTile(
                    onTap: () async{
                      await getfilename(2).then((value) {
                        choosedfile=value;
                        Navigator.pop (context,value);
                      });
                    },
                    leading: Icon(
                      Icons.image,

                    ),
                    title: Text( "Gallery", ),
                  )
                ],
              ),
            ))).then((value) {
              if(value!=null){
                choosedfile=value;
              }
    });
    return choosedfile;
  }
  Future<File?> getfilename(int choice) async {
    File ? selected_file;
    if (choice == 1) {
      final image =
      await ImagePicker.platform.getImage(source: ImageSource.camera);

     selected_file=File(image!.path);


    } else {
      final image =
      await ImagePicker.platform.getImage(source: ImageSource.gallery);

      selected_file=File(image!.path);
    }
    return selected_file;
  }
  Future generateImage() async {

    var headers = {
      'Authorization': 'Bearer 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'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://api.openai.com/v1/images/variations'));
    request.fields.addAll({
      'n': '2',
      'size': '1024x1024'
    });
    request.files.add(await http.MultipartFile.fromPath('image', '/Users/macos/Downloads/instagram_logo-new.png'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  void pickAndUploadImage() async {
    try {
      var headers = {
        'Authorization': 'Bearer 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',
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.openai.com/v1/images/variations'),
      );
      request.fields.addAll({
        'n': '2',
        'size': '1024x1024',
      });

      // Allow the user to pick a file using the file_picker package.
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result.files.isNotEmpty) {
        String filePath = result.files.single.path!;
        File pickedFile = File(filePath);

        // Get the application's documents directory (or appropriate directory) on the device.
        var documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
        var imagePath = path.join(documentsDirectory.path, path.basename(filePath));

        // Copy the picked file to the app's directory.
        await pickedFile.copy(imagePath);

        // Add the copied file to the request.
        request.files.add(await http.MultipartFile.fromPath('image', imagePath));
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
        } else {
          print(response.reasonPhrase);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  void makeApiRequest() async {

    final imageBytes = await imageFile!.readAsBytes();
    final imageBase64 = base64Encode(imageBytes);


    final url = Uri.parse('https://api.openai.com/v1/images/variations');

    // Replace with your actual OpenAI API key
    final openaiApiKey = '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'; // Replace with your OpenAI API key


    // Replace with the actual path to your otter.png file


    // Create the multipart request
    final request = http.MultipartRequest('POST', url);

    // Set the authorization header
    request.headers['Authorization'] = 'Bearer $openaiApiKey';

    // Add the image file to the request
    request.files.add(await http.MultipartFile.fromPath('image', imageFile!.path));

    // Add other form fields
    request.fields['n'] = '2';
    request.fields['size'] = '1024x1024';

    // Send the request and get the response
    final response = await http.Response.fromStream(await request.send());

    // Handle the response
    if (response.statusCode == 200) {
      print('Success: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


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
                        Text("Geni AI ",
                          style:myStyle.getblack(FontWeight.w500, height*0.031),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  ),
                ),


                SizedBox(height: height*0.035,),
                Container(

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
                      )
                  ),
                  padding: EdgeInsets.only(left: 20,bottom: 5,top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("What to ",
                            style: myStyle.getwhitebold(FontWeight.w500, height*0.026),
                          ),

                          Text(" Expect",
                            style: myStyle.getblackbold(FontWeight.w500, height*0.026),
                          ),
                        ],
                      ),
                      Text("The type of AI we utilize for AI Avatar may generate artifacts, inaccuracies and defects in output images (it is out of our control). So please acknowledge and accept that risk before continue. ",
                        style: myStyle.get6C6C6C(FontWeight.w500, height*0.016),
                      ),

                      Container(
                        width: width*0.6,
                        child: Text("The more variations you get, the better chance for great results !",style: myStyle.getwhite(FontWeight.w500, height*0.016),
                        ),
                      ),
                    ],
                  )
                  ,
                ),
                SizedBox(height: height*0.05,),
                imageFile==null?
                InkWell(
                  onTap: ()async{
                   await  _pickimage().then((value) {
                     if(value!=null){
                       print("jaan");
                       setState(() {
                         imageFile=value;
                       });
                     }
                     else{
                       print("lund");
                     }
                   });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("Good ",
                          style: myStyle.getblack(FontWeight.w500, height*0.026),
                        ),

                        Text("Results",
                          style: myStyle.getblackbold(FontWeight.w500, height*0.026),
                        ),
                      ],
                    ),
                  ),
                ):Text(imageFile!.path),
                SizedBox(height: height*0.025,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height*0.18,
                        width: width*0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image:
                            AssetImage("images/Layer 18 1.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Container(
                        height: height*0.18,
                        width: width*0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image:
                            AssetImage("images/Layer 17 1.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.025,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height*0.18,
                        width: width*0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image:
                            AssetImage("images/Layer 19 1.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Container(
                        height: height*0.18,
                        width: width*0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image:
                            AssetImage("images/Layer 20 1.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.03,),
                InkWell(
                  onTap: (){
                    // Navigator.of(context).pushNamed(Ai_ImageScreen.routename);
                    makeApiRequest();
                  },
                  child: Container(
                    height: height*0.07,
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
                        )
                    ),
                    padding: EdgeInsets.only(left: 20,bottom: 5,top: 5),
                    child:  Center(child: Text("Got it !", style: myStyle.getwhite(FontWeight.w700, height*0.025))),
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
