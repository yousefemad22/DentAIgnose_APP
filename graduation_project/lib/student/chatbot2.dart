import 'dart:async';
import 'dart:convert';
// import 'package:horus_eye/models/message/message.dart';
import 'package:http/http.dart' as http;

class OpenAi {
  var key = 'api-key';
  var uri = Uri.parse("https://api.openai.com/v1/chat/completions");

  Future<dynamic> chat(
      {required String prompt, required String systemContent}) async {
    final headers = {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer $key'
    };
    final body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": systemContent},
        {"role": "user", "content": prompt}
      ]
    });

    final response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      var choices = decodedResponse['choices'][0];
      var message = choices['message'];
      var output = message['content'];
      print(output);
      return output;
    } else {
      print("response.statusCode:${response.statusCode}");
      return response.statusCode;
    }
  }
}

void main() async {
  var message = await OpenAi().chat(prompt: 'hi chat gpt', systemContent: '');
  print(message);
}
