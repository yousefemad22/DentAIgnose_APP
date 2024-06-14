import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  List<types.Message> _messages = [];
  final _user = types.User(id: 'user');

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _randomString(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    _getBotResponse(message.text);
  }

  Future<void> _getBotResponse(String query) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_OPENAI_KEY',
        },
        body: jsonEncode({
          "model": "text-davinci-003",  // Specify the correct model
          "prompt": query,
          "max_tokens": 150
        }),
      );

      if (response.statusCode == 200) {
        final botResponse = jsonDecode(response.body)['choices'][0]['text'].trim();
        final botMessage = types.TextMessage(
          author: types.User(id: 'bot'),
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: _randomString(),
          text: botResponse,
        );

        setState(() {
          _messages.insert(0, botMessage);
        });
      } else {
        // Handle HTTP errors
        throw Exception('Failed to fetch response: ${response.statusCode}');
      }
    } catch (e) {
      // Handle general errors
      final errorMessage = types.TextMessage(
        author: types.User(id: 'bot'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _randomString(),
        text: 'Error: ${e.toString()}',
      );

      setState(() {
        _messages.insert(0, errorMessage);
      });
    }
  }

  String _randomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rnd = Random();
    return String.fromCharCodes(Iterable.generate(
      10,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Chat Bot'),
      //   backgroundColor: Colors.blueGrey,
      // ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }
}
