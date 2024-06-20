import 'package:flutter/material.dart';

class ovColumn extends StatefulWidget {
  final String? img;
  final String? range;
  final String? num;

   ovColumn({this.img,this.num,this.range});

  @override
  State<ovColumn> createState() => _ovColumnState();
}

class _ovColumnState extends State<ovColumn> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              'images/circle.png',
              width: screenSize.width*0.3,
              // height: 92,
            ),
            Image.asset(
              widget.img!,
              width: screenSize.width*0.3,
              // height: 92,
            ),
          ],
        ),
        Text(
          widget.num!,
          style: TextStyle(
              fontSize: screenSize.width*0.08,
              fontWeight: FontWeight.bold,
              color: Color(0XFF1FAAEB)),
        ),
        SizedBox(
          height: screenSize.height*0.001,
        ),
        Text(
          widget.range!,
          style: TextStyle(
              fontSize: screenSize.width*0.07,
              fontWeight: FontWeight.bold,
              color: Color(0XFF1FAAEB)),
        ),
      ],
    );
  }
}
