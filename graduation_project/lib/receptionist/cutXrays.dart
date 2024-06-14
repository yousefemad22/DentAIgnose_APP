import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;

class ImageFromUrl extends StatefulWidget {
  String imageURL;
  Map prediction;
  ImageFromUrl({required this.imageURL, required this.prediction});

  @override
  _ImageFromUrlState createState() => _ImageFromUrlState();
}

class _ImageFromUrlState extends State<ImageFromUrl> {
  img.Image? originalImage;
  img.Image? croppedImage;

  @override
  void initState() {
    super.initState();
    print(widget.prediction);
    loadImageAndCrop();
  }

  Future<void> loadImageAndCrop() async {
    originalImage = await fetchAndDecodeImage(widget.imageURL);
    if (originalImage != null) {
      cropImageBasedOnPrediction(originalImage!, widget.prediction);
    }
  }

  Future<img.Image?> fetchAndDecodeImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        Uint8List imageData = Uint8List.fromList(response.bodyBytes);
        return img.decodeImage(imageData);
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print('Error fetching or decoding image: $e');
      return null;
    }
  }

  // void cropImageBasedOnPrediction(img.Image image, Map prediction) {
  //   final bbox = prediction['predictions'][1]; // Assuming the bounding box data is here
  //   final x = bbox['x'].toInt();
  //   final y = bbox['y'].toInt();
  //   final width = bbox['width'].toInt();
  //   final height = bbox['height'].toInt();

  //   croppedImage = img.copyCrop(image, x, y, width, height);
  //   setState(() {}); // Update UI to show cropped image
  // }

  void cropImageBasedOnPrediction(img.Image image, Map prediction) {
    final bbox =
        prediction['predictions'][0]; // Assuming the bounding box data is here

    // If bounding box values are normalized or based on a different image size, scale them
    // Suppose 'originalWidth' and 'originalHeight' are the dimensions used for bounding box calculation
    final originalWidth = prediction['image']['width'];
    final originalHeight = prediction['image']['height'];

    // Calculate the scale factors
    double scaleX = image.width / originalWidth;
    double scaleY = image.height / originalHeight;

    // Apply scale factors to the bounding box coordinates and dimensions
    final x = (bbox['x'] * scaleX).toInt();
    final y = (bbox['y'] * scaleY).toInt();
    final width = (bbox['width'] * scaleX).toInt();
    final height = (bbox['height'] * scaleY).toInt();

    // Crop the image
    croppedImage = img.copyCrop(image, x, y, width, height);
    setState(() {
      print(widget.prediction);
    }); // Update UI to show cropped image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Image Crop Example"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (originalImage != null)
                Image.memory(Uint8List.fromList(img.encodePng(originalImage!))),
              SizedBox(height: 20),
              if (croppedImage != null)
                Column(
                  children: [
                    Image.memory(
                        Uint8List.fromList(img.encodePng(croppedImage!))),
                    Text(
                        widget.prediction['predictions'][0]['class'].toString()),
                    Text(
                        widget.prediction['predictions'][0]['confidence'].toString()),
                  ],
                ),
              ElevatedButton(
                onPressed: loadImageAndCrop,
                child: Text('Reload and Recrop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:io';
// import 'package:image/image.dart';

// class Prediction {
//   double x, y, width, height;
//   double confidence;
//   String classification;
//   int classId;
//   String detectionId;

//   Prediction({
//     required this.x,
//     required this.y,
//     required this.width,
//     required this.height,
//     required this.confidence,
//     required this.classification,
//     required this.classId,
//     required this.detectionId,
//   });
// }

// cutTheShit(sourceImgPath, predictionData) {
//   var cuttedImagePathes = [];
//   // Load the source image
//   final sourceImagePath = sourceImgPath;
//   final sourceImage = decodeImage(File(sourceImagePath).readAsBytesSync());

//   if (sourceImage == null) {
//     print('Error: Could not decode the source image.');
//     return;
//   }

//   // // Sample prediction data
//   // Map<String, dynamic> predictionData = {
//   //   "time": 0.03274494599997979,
//   //   "image": {"width": 114, "height": 200},
//   //   "predictions": [
//   //     {
//   //       "x": 65.0,
//   //       "y": 94.0,
//   //       "width": 82.0,
//   //       "height": 92.0,
//   //       "confidence": 0.5314251184463501,
//   //       "class": "NORMAL",
//   //       "class_id": 2,
//   //       "detection_id": "b8669d18-d366-472b-87ae-83bf47f42033"
//   //     }
//   //   ]
//   // };

//   // Parse the predictions
//   List<Prediction> predictions =
//       (predictionData['predictions'] as List).map((pred) {
//     return Prediction(
//       x: pred['x'],
//       y: pred['y'],
//       width: pred['width'],
//       height: pred['height'],
//       confidence: pred['confidence'],
//       classification: pred['class'],
//       classId: pred['class_id'],
//       detectionId: pred['detection_id'],
//     );
//   }).toList();

//   // Process each prediction
//   for (var prediction in predictions) {
//     // Cut the image based on the prediction
//     final cutImage = copyCrop(
//       sourceImage,
//       prediction.x.toInt(),
//       prediction.y.toInt(),
//       prediction.width.toInt(),
//       prediction.height.toInt(),
//     );

//     // Save the cut image
//     final outputImagePath = '${prediction.detectionId}.jpg';
//     File(outputImagePath).writeAsBytesSync(encodeJpg(cutImage));
//     print('Saved ${prediction.detectionId} to $outputImagePath');
//     cuttedImagePathes.add(outputImagePath);
//   }
//   return cuttedImagePathes;
// }
