import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider package
import 'package:http/http.dart' as http;


class MaskImageScreen extends StatefulWidget {
  @override
  _MaskImageScreenState createState() => _MaskImageScreenState();
}

class _MaskImageScreenState extends State<MaskImageScreen> {
  List<List<Offset>> strokes = [];
  List<Offset> currentStroke = [];
  ui.Image? _image;
  Future<File> assetToFile() async {
    final ByteData data = await rootBundle.load("images/sample.jpeg");
    final Uint8List bytes = data.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/assets');
    await file.writeAsBytes(bytes);
    return file;
  }


  Future<void> editImage({

    required String imagePath,
    required String maskPath,

  }) async {

    final String prompt ="Shahrukh khan standing infont of building";
    final int n = 1;
    final String size = '1024x1024';


    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.openai.com/v1/images/edits'),
    );

    request.headers.addAll({
      'Authorization': 'Bearer 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',
    });

    request.files.add(
      await http.MultipartFile.fromPath('image', imagePath),
    );

    request.files.add(
      await http.MultipartFile.fromPath('mask', maskPath),
    );

    request.fields.addAll({
      'prompt': prompt,
      'n': n.toString(),
      'size': size,
    });

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print('Response Data: $responseData');
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      print('Error: $e');
    }

  }

  @override
  void initState() {
    super.initState();
    _loadImage('images/sample.jpeg'); // Replace with your image path
  }

  Future<Future<ui.Image>> _loadImage(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      setState(() {
        _image = img;
      });
      completer.complete(img);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Masking'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            currentStroke.add(details.localPosition);
          });
        },
        onPanEnd: (_) {
          setState(() {
            strokes.add(List.from(currentStroke)); // Store the current stroke
            currentStroke.clear();
          });
        },
        child: Stack(
          children: [
            if (_image != null)
              CustomPaint(
                painter: MaskPainter(strokes, _image),
                size: Size.infinite,
              ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  strokes.clear();
                });
              },
              child: Icon(Icons.clear),
            ),
            FloatingActionButton(
              onPressed: () async {
                if (_image != null) {
                  final recorder = ui.PictureRecorder();
                  final canvas = Canvas(
                    recorder,
                    Rect.fromPoints(
                      Offset(0, 0),
                      Offset(_image!.width.toDouble(), _image!.height.toDouble()),
                    ),
                  );

                  final maskPainter = MaskPainter(strokes, null);
                  maskPainter.paint(canvas, Size(_image!.width.toDouble(), _image!.height.toDouble()));

                  final picture = recorder.endRecording();
                  final img = await picture.toImage(_image!.width, _image!.height);
                  final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);

                  final directory = await getApplicationDocumentsDirectory();
                  final imagePath = '${directory.path}/painted_image.png';
                  var result=await File(imagePath).writeAsBytes(pngBytes!.buffer.asUint8List());
                  print(result.path.toString());
                  File assetimage=await assetToFile();
                  editImage(imagePath: assetimage.path, maskPath: imagePath,);

                }
              },
              child: Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }
}

class MaskPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final ui.Image? image;

  MaskPainter(this.strokes, this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20.0;

    if (image != null) {
      final src = Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble());
      final dst = Rect.fromLTWH(0, 0, size.width, size.height);
      canvas.drawImageRect(image!, src, dst, paint);
    }

    for (final stroke in strokes) {
      for (int i = 0; i < stroke.length - 1; i++) {
        canvas.drawLine(stroke[i], stroke[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
