import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appbar3 extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backColor;
  var fun;
  appbar3({super.key, required this.title, required this.backColor, this.fun});

  @override
  State<appbar3> createState() => _appbar3State();

  @override
  Size get preferredSize => Size.fromHeight(75.0);
}

class _appbar3State extends State<appbar3> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      color: widget.backColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   width: 20,
            // ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.02,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: screenSize.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),

            // SizedBox(
            //   width: 120,
            // ),
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
                    width: screenSize.width * 0.15,
                    // height: 33,
                  ),
                  Text(
                    'DentAIgnose',
                    style: TextStyle(
                        fontSize: screenSize.width * .04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.0);
}
