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
    return Container(
      decoration:   const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.lightBlue,
        ]),
        image: DecorationImage(

          image: AssetImage("assets/images/logo2.png" ),
          opacity: 0.2,

        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Image.asset('assets/images/',width:300 ,),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text('Set a new password ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 37,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                        'Create a new password. Ensure it differs from previous ones for security',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(.7),
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  const Text('password ',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: 'Enter your new password'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  const Text('Confirm password ',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        hintText: 'Re-enter your new password'),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: FilledButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        fixedSize: const Size(200, 50),
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(),));
                      },
                      child: const Text(
                        'Update Password',
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
