import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImagePredictionService {
  static final String API_KEY = 'api-key';
  static final String MODEL_ENDPOINT = 'dental-annotation/7';

  Future<Map<String, dynamic>> predictImage(String image) async {
    final File tempFile = File(image);

    final bytes = await tempFile.readAsBytes();
    final String encodedFile = base64.encode(bytes);

    final String uploadURL =
        "https://detect.roboflow.com/$MODEL_ENDPOINT?api_key=$API_KEY&name=$image";

    HttpClientRequest request;
    HttpClientResponse response;

    try {
      final HttpClient httpClient = HttpClient();
      request = await httpClient.postUrl(Uri.parse(uploadURL));
      request.headers.set('Content-Type', 'application/json');
      // request.headers.set('Content-Type', 'application/x-www-form-urlencoded');
      request.headers.set('Content-Length', encodedFile.length.toString());
      request.headers.set('Content-Language', 'en-US');
      request.add(utf8.encode(encodedFile));
      response = await request.close();
      print("respose: $response");
      final String responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } catch (e) {
      print(e);
      return {};
    }
  }
}
