import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';

class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          toolbarHeight: fem * 60,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
              size: fem * 35,
            ),
            iconSize: fem * 52,
          ),
          title: Text(
            'Notification ',
            style: TextStyle(
              fontSize: 25 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          // margin: EdgeInsets.fromLTRB(40 * fem, 0, 42 * fem, 34 * fem),
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: Color(0xff26a6fe),
          ),
        ),

      ),
    );
  }
}
