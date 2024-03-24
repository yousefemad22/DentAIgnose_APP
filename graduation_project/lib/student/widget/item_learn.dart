import 'package:flutter/material.dart';

class item extends StatefulWidget {
  final String? img;
  final String? text;
  final String? print;
  const item({this.img, this.text,this.print});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.print!);
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
