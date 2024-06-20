import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:graduation_project/password/check_new_password.dart';
import 'Set_new_password.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1bade1), Color(0xFF26a6fe), Color(0xFF9de8fc)]),
        image: DecorationImage(
            image: AssetImage("images/لوجو.png"),
            opacity: 0.3,
            ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * .05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              // size: 25,
                              color: Color(0xFF1A7AC5),
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("images/لوجو.png"),
                            width: screenSize.width * 0.2,
                            // height: screenHeight * .1,
                          ),
                          Text(
                            "Dentalgnose",
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: screenSize.height*0.08 ,
                ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Set a new password ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: screenSize.width*0.08,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                   ],
                 ),
                 SizedBox(
                  height: screenSize.height*0.06 ,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.05),
                  child: Text(
                      'Create a new password. Ensure it differs from previous ones for security',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: screenSize.width*0.05,
                          color: Colors.white.withOpacity(.7),
                          fontWeight: FontWeight.bold)),
                ),
                 SizedBox(
                  height: screenSize.height*0.06,
                ),

                 Text('password ',
                    style: TextStyle(
                        fontSize: screenSize.width*0.07,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                 SizedBox(
                  height: screenSize.height*0.01,
                ),
                Container(
                  margin:EdgeInsets.symmetric(horizontal:screenSize.width*.04, vertical: screenSize.height*0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: 'Enter your new password'),
                  ),
                ),
                 SizedBox(
                  height: screenSize.height*0.05,
                ),

                 Text('Confirm password ',
                    style: TextStyle(
                        fontSize: screenSize.width*0.07,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                 SizedBox(
                  height: screenSize.height*0.01,
                ),
                Container(
                  margin:EdgeInsets.symmetric(horizontal:screenSize.width*.04, vertical: screenSize.height*0),

                  child: TextFormField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: 'Re-enter your new password'),
                  ),
                ),

                 SizedBox(
                  height: screenSize.height*0.05,
                ),
                Center(
                  child: FilledButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      fixedSize:  Size(screenSize.width*.5, screenSize.height*0.05),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Screen2(),
                          ));
                    },
                    child:  Text(
                      'Update Password',
                      style: TextStyle(color: Colors.black87,  fontSize: screenSize.width*0.045,fontWeight: FontWeight.bold),
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
