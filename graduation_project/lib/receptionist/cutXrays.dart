import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class ImageFromUrl extends StatefulWidget {
  final String imageURL;
  final Map prediction;
  ImageFromUrl({required this.imageURL, required this.prediction});

  @override
  _ImageFromUrlState createState() => _ImageFromUrlState();
}

class _ImageFromUrlState extends State<ImageFromUrl> {
  img.Image? originalImage;
  List<img.Image> croppedImages = [];
  List predForCroppedImages = [];
  List confForCroppedImages = [];

  @override
  void initState() {
    super.initState();
    loadImageAndCrop();
  }

  Future<void> loadImageAndCrop() async {
    originalImage = await fetchAndDecodeImage(widget.imageURL);
    if (originalImage != null) {
      cropImageBasedOnPredictions(originalImage!, widget.prediction);
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

  void cropImageBasedOnPredictions(img.Image image, Map prediction) {
    croppedImages.clear(); // Clear previous cropped images
    final predictions = prediction['predictions'] as List<dynamic>;
    for (var bbox in predictions) {
      final width = bbox['width'].toInt();
      final height = bbox['height'].toInt();
      final x = bbox['x'].toInt();
      final y = bbox['y'].toInt();
      croppedImages.add(img.copyCrop(image, x, y, width, height));
      predForCroppedImages.add(bbox['class']);
      confForCroppedImages.add(bbox['confidence']);
    }
    setState(() {}); // Update UI to show all cropped images
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Crop Example"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (originalImage != null)
                Image.memory(Uint8List.fromList(img.encodePng(originalImage!))),
              SizedBox(height: 20),
              // Wrap(
              //   spacing: 10,
              //   children: croppedImages.map((cropped) {
              //     return Column(
              //       children: [
              //         Image.memory(Uint8List.fromList(img.encodePng(cropped))),
              //         // Add any additional information here like class, confidence, etc.
              //       ],
              //     );
              //   }).toList(),
              // ),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: croppedImages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.memory(Uint8List.fromList(
                                  img.encodePng(croppedImages[index]))),
                              SizedBox(height: 5),
                              Text(predForCroppedImages[index]),
                              SizedBox(height: 5),
                              Text(confForCroppedImages[index].toString()),
                            ],
                          ),
                        ],
                      );
                    }),
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
