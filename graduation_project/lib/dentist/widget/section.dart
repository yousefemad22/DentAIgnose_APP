import 'package:flutter/material.dart';
class sectionTitle extends StatelessWidget {
  final String title;
   sectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin:  EdgeInsets.only(left: screenSize.width*0.05, top: screenSize.height*0.01),
      width: double.infinity,
      child:  Text(
        '$title',
        style: TextStyle(
            fontSize: screenSize.width*0.065,
            fontWeight: FontWeight.bold,
            color: Color(0xff26a6fe)),
      ),
    );
  }
}

