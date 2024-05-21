import 'dart:io';
import 'package:image/image.dart';

class Prediction {
  double x, y, width, height;
  double confidence;
  String classification;
  int classId;
  String detectionId;

  Prediction({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.confidence,
    required this.classification,
    required this.classId,
    required this.detectionId,
  });
}

cutTheShit(sourceImgPath, predictionData) {
  var cuttedImagePathes = [];
  // Load the source image
  final sourceImagePath = sourceImgPath;
  final sourceImage = decodeImage(File(sourceImagePath).readAsBytesSync());

  if (sourceImage == null) {
    print('Error: Could not decode the source image.');
    return;
  }

  // // Sample prediction data
  // Map<String, dynamic> predictionData = {
  //   "time": 0.03274494599997979,
  //   "image": {"width": 114, "height": 200},
  //   "predictions": [
  //     {
  //       "x": 65.0,
  //       "y": 94.0,
  //       "width": 82.0,
  //       "height": 92.0,
  //       "confidence": 0.5314251184463501,
  //       "class": "NORMAL",
  //       "class_id": 2,
  //       "detection_id": "b8669d18-d366-472b-87ae-83bf47f42033"
  //     }
  //   ]
  // };

  // Parse the predictions
  List<Prediction> predictions =
      (predictionData['predictions'] as List).map((pred) {
    return Prediction(
      x: pred['x'],
      y: pred['y'],
      width: pred['width'],
      height: pred['height'],
      confidence: pred['confidence'],
      classification: pred['class'],
      classId: pred['class_id'],
      detectionId: pred['detection_id'],
    );
  }).toList();

  // Process each prediction
  for (var prediction in predictions) {
    // Cut the image based on the prediction
    final cutImage = copyCrop(
      sourceImage,
      prediction.x.toInt(),
      prediction.y.toInt(),
      prediction.width.toInt(),
      prediction.height.toInt(),
    );

    // Save the cut image
    final outputImagePath = '${prediction.detectionId}.jpg';
    File(outputImagePath).writeAsBytesSync(encodeJpg(cutImage));
    print('Saved ${prediction.detectionId} to $outputImagePath');
    cuttedImagePathes.add(outputImagePath);
  }
  return cuttedImagePathes;
}
