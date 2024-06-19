import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<img.Image> processImage(String imageURL, var prediction) async {
  // Fetch the image
  final imageUrl = imageURL;
  final file = await DefaultCacheManager().getSingleFile(imageUrl);
  List<int> imageBytes = await file.readAsBytes();
  img.Image image = img.decodeImage(imageBytes)!;

  List predictions = prediction['predictions'];
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
    } else if (prediction['class'] == "Overhang") {
      // ------
      r = 150;
      g = 100;
      b = 100;
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
    img.drawString(image, img.arial_14, x + 2, y + 2, "${prediction['class']}",
        color: img.getColor(r, g, b));
  }
  return image;
}

Future<Uint8List> getProcessedImageBytes(
    String imageURL, var prediction) async {
  img.Image processedImage = await processImage(imageURL, prediction);
  List<int> encodedImage = img.encodeJpg(processedImage);
  return Uint8List.fromList(encodedImage);
}
