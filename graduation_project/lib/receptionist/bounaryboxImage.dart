import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageProcessor extends StatefulWidget {
  var imageURL, prediction;
  ImageProcessor({this.imageURL, this.prediction});

  @override
  _ImageProcessorState createState() => _ImageProcessorState();
}

class _ImageProcessorState extends State<ImageProcessor> {
  img.Image? processedImage;

  @override
  void initState() {
    super.initState();
    processImage();
  }

  Future<void> processImage() async {
    // Fetch the image
    final imageUrl = widget.imageURL;
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    List<int> imageBytes = await file.readAsBytes();
    img.Image image = img.decodeImage(imageBytes)!;

    List predictions = widget.prediction['predictions'];
    // Draw bounding boxes and labels
    for (var prediction in predictions) {
      int r = 0, g = 0, b = 0; // Default black color if no class matches
      if (prediction['class'] == "RCT") {
        // Red
        r = 255;
      } else if (prediction['class'] == "NORMAL") {
        // Yellow
        r = 255;
        g = 255;
      } else if (prediction['class'] == "Restoration") {
        // Green
        g = 255;
        b = 100;
      } else if (prediction['class'] == "caries") {
        // Blue
        r = 100;
        b = 255;
      } else if (prediction['class'] == "crown") {
        // ------
        r = 200;
        g = 50;
        b = 150;
      } else if (prediction['class'] == "Badly Decayes") {
        // ------
        g = 150;
        b = 200;
      }
      int width = prediction['width'].round();
      int height = prediction['height'].round();
      int x = (prediction['x'] - 0.5 * width).round();
      int y = (prediction['y'] - 0.5 * height).round();
      img.drawRect(
        image,
        x,
        y,
        x + width,
        y + height,
        img.getColor(r, g, b),
      );
      img.drawString(
          image, img.arial_14, x + 2, y + 2, "${prediction['class']}",
          color: img.getColor(r, g, b));
    }

    // Update processed image only once
    setState(() {
      processedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Processing'),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: processedImage == null
                  ? CircularProgressIndicator()
                  : Image.memory(
                      Uint8List.fromList(img.encodePng(processedImage!))),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    processImage();
                  });
                },
                child: Text("Reload"))
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
// import 'package:http/http.dart' as http;

// class BoxPainter extends CustomPainter {
//   final List<dynamic> boxes;
//   final img.Image image;

//   BoxPainter({required this.boxes, required this.image});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;

//     // Calculate scale based on the size of the canvas (widget's size)
//     double scaleX = size.width / image.width;
//     double scaleY = size.height / image.height;

//     for (var box in boxes) {
//       final rect = Rect.fromLTWH(
//         box['x'] * image.width * scaleX, // Convert normalized to pixel and scale to widget
//         box['y'] * image.height * scaleY,
//         box['width'] * image.width * scaleX,
//         box['height'] * image.height * scaleY,
//       );
//       canvas.drawRect(rect, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }


// class ImageAnalysisPage extends StatefulWidget {
//   final String imageURL;
//   final Map prediction;

//   const ImageAnalysisPage({Key? key, required this.imageURL, required this.prediction}) : super(key: key);

//   @override
//   _ImageAnalysisPageState createState() => _ImageAnalysisPageState();
// }

// class _ImageAnalysisPageState extends State<ImageAnalysisPage> {
//   img.Image? originalImage;

//   @override
//   void initState() {
//     super.initState();
//     fetchAndDecodeImage();
//   }

//   Future<void> fetchAndDecodeImage() async {
//     try {
//       final response = await http.get(Uri.parse(widget.imageURL));
//       if (response.statusCode == 200) {
//         Uint8List imageData = Uint8List.fromList(response.bodyBytes);
//         setState(() {
//           originalImage = img.decodeImage(imageData);
//         });
//       } else {
//         throw Exception('Failed to load image');
//       }
//     } catch (e) {
//       print('Error fetching or decoding image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Analysis'),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//       body: originalImage == null
//           ? Center(child: CircularProgressIndicator())
//           : Center(
//             child: CustomPaint(
//                 painter: BoxPainter(
//                   boxes: widget.prediction['predictions'],
//                   image: originalImage!,
//                 ),
//                 child: Center(
//                   child: Image.memory(Uint8List.fromList(img.encodePng(originalImage!))),
//                 ),
//               ),
//           ),
//     );
//   }
// }
