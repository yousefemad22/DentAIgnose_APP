import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/get_start/login.dart';

import 'package:http/http.dart' as http;

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenSize.height * 0.1),
                  child: Image(
                    width: screenSize.width * 1.0,
                    image: AssetImage(
                      'images/لوجو.png',
                    ),
                    // image: AssetImage('images/XrayTest.jpg'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DentAIgnose',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height*0.06),
                  child: Text('Find your best Dentists',
                      style: TextStyle(color: Colors.white, fontSize: screenSize.width * 0.05)),
                ),
                Text('without wasting time',
                    style: TextStyle(color: Colors.white, fontSize: screenSize.width * 0.05)),
                SizedBox(
                  height: screenSize.height*0.05,
                ),
                GestureDetector(
                  onTap: () {
                    print(',jascjs');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    width: screenSize.width* 0.5,
                    height: screenSize.height * 0.05,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
