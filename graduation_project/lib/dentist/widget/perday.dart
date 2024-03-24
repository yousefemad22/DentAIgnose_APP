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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              'images/circle.png',
              width: 83,
              height: 92,
            ),
            Image.asset(
              widget.img!,
              width: 83,
              height: 92,
            ),
          ],
        ),
        Text(
          widget.num!,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0XFF1FAAEB)),
        ),
        Text(
          widget.range!,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0XFF1FAAEB)),
        ),
      ],
    );
  }
}
