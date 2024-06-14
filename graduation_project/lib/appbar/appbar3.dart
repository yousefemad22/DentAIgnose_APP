import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appbar3 extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backColor;
  appbar3({super.key, required this.title, required this.backColor});

  @override
  State<appbar3> createState() => _appbar3State();

  @override
  Size get preferredSize => Size.fromHeight(75.0);
}

class _appbar3State extends State<appbar3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            width: 120,
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/لوجو.png',
                  width: 66,
                  height: 33,
                ),
                Text(
                  'DentAIgnose',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.0);
}
