import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_image_compress/flutter_image_compress.dart';

class RoboflowClient {
  final String apiUrl;
  final String apiKey;

  RoboflowClient({required this.apiUrl, required this.apiKey});

  Future<Map<String, dynamic>> infer(String imagePath, String modelId) async {
    try {
      Uint8List imageBytes = await getImageBytes(imagePath);
      String base64Image = base64Encode(imageBytes);

      Map<String, dynamic> requestBody = {
        "image": base64Image,
        "model_id": modelId,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to infer: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error during inference: $e');
    }
  }

  Future<Uint8List> getImageBytes(String imagePath) async {
    try {
      // Compress image
      Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
        imagePath,
        minHeight: 800,
        minWidth: 600,
      );

      // Check if compressedBytes is not null, then convert to non-nullable Uint8List
      if (compressedBytes != null) {
        return Uint8List.fromList(compressedBytes);
      } else {
        throw Exception('Failed to compress image.');
      }
    } catch (e) {
      throw Exception('Error during image compression: $e');
    }
  }
}

/*
class MyModelScreen extends StatefulWidget {
  @override
  _MyModelScreenState createState() => _MyModelScreenState();
}

class _MyModelScreenState extends State<MyModelScreen> {
  final RoboflowClient client = RoboflowClient(
    apiUrl: 'https://detect.roboflow.com',
    apiKey: 'pBgyltHaxBfEFNMlUFmm',
  );

  String predictionResult = '';

  void predict(String imagePath, String modelId) async {
    try {
      // Perform inference
      Map<String, dynamic> result = await client.infer(imagePath, modelId);

      // Handle the result according to your app's requirements
      setState(() {
        predictionResult = result.toString();
      });
    } catch (e) {
      setState(() {
        predictionResult = 'Error: $e';
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Model Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => predict("YOUR_IMAGE.jpg", "dental-annotation/7"),
              child: Text('Predict'),
            ),
            SizedBox(height: 20),
            Text('Prediction Result: $predictionResult'),
          ],
        ),
      ),
    );
  }
}
*/