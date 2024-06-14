import 'package:flutter/material.dart';
import 'package:graduation_project/student/widget/learn.dart';

class item extends StatefulWidget {
  final String? img;
  final String? text;
  final String? print;
  const item({this.img, this.text, this.print});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.print!);
        if (widget.print == "Articles") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Learn(whichLearn: 1)));
        } else if (widget.print == "Videos") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Learn(whichLearn: 2)));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Learn(whichLearn: 3)));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.img!),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.text!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}
