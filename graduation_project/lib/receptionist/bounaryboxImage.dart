import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;

class BoxPainter extends CustomPainter {
  final List<dynamic> boxes;
  final img.Image image;

  BoxPainter({required this.boxes, required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Calculate scale based on the size of the canvas (widget's size)
    double scaleX = size.width / image.width;
    double scaleY = size.height / image.height;

    for (var box in boxes) {
      final rect = Rect.fromLTWH(
        box['x'] * image.width * scaleX, // Convert normalized to pixel and scale to widget
        box['y'] * image.height * scaleY,
        box['width'] * image.width * scaleX,
        box['height'] * image.height * scaleY,
      );
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class ImageAnalysisPage extends StatefulWidget {
  final String imageURL;
  final Map prediction;

  const ImageAnalysisPage({Key? key, required this.imageURL, required this.prediction}) : super(key: key);

  @override
  _ImageAnalysisPageState createState() => _ImageAnalysisPageState();
}

class _ImageAnalysisPageState extends State<ImageAnalysisPage> {
  img.Image? originalImage;

  @override
  void initState() {
    super.initState();
    fetchAndDecodeImage();
  }

  Future<void> fetchAndDecodeImage() async {
    try {
      final response = await http.get(Uri.parse(widget.imageURL));
      if (response.statusCode == 200) {
        Uint8List imageData = Uint8List.fromList(response.bodyBytes);
        setState(() {
          originalImage = img.decodeImage(imageData);
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error fetching or decoding image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Analysis'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: originalImage == null
          ? Center(child: CircularProgressIndicator())
          : Center(
            child: CustomPaint(
                painter: BoxPainter(
                  boxes: widget.prediction['predictions'],
                  image: originalImage!,
                ),
                child: Center(
                  child: Image.memory(Uint8List.fromList(img.encodePng(originalImage!))),
                ),
              ),
          ),
    );
  }
}
