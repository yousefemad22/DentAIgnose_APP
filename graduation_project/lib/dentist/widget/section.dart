import 'package:flutter/material.dart';
class sectionTitle extends StatelessWidget {
  final String title;
   sectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 10),
      width: double.infinity,
      child:  Text(
        '$title',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff26a6fe)),
      ),
    );
  }
}

