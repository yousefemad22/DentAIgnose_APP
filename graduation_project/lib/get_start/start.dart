import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/get_start/login.dart';

import 'package:graduation_project/roboflow_connection.dart';

import 'package:http/http.dart' as http;

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  var url = 'http://10.0.2.2:5000/pred';
  var data;
  String output = 'Initial Output';

  fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1bade1), Color(0xFF26a6fe), Color(0xFF9de8fc)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: Image(
                  image: AssetImage('images/لوجو.png'),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(),
              //       child: Text(
              //         'Dent',
              //         style: TextStyle(color: Colors.white, fontSize: 40),
              //       ),
              //     ),
              //     Text('AI',
              //         style: TextStyle(color: Colors.white, fontSize: 50)),
              //     Text('gnose',
              //         style: TextStyle(color: Colors.white, fontSize: 40)),
              //   ],
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: MediaQuery.of(context).size.height * 0.05),
              //   child: Text('Find your best Dentists',
              //       style: TextStyle(color: Colors.white, fontSize: 20)),
              // ),
              // Text('without wasting time',
              //     style: TextStyle(color: Colors.white, fontSize: 20)),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        data = fetchdata(url);
                        var decoded = jsonDecode(data);
                        setState(() {
                          output = decoded['output'];
                        });
                      },
                      child: Text('Predict'),
                    ),
                    SizedBox(height: 20),
                    Text('Prediction Result: $output'),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: GestureDetector(
                  onTap: () {
                    print(',jascjs');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    width: MediaQuery.of(context).size.width * 0.64,
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
