import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/student/widget/model_reports.dart';

class detials extends StatelessWidget {
  int index;
  detials({required int this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
              size: 50,
            ),
          ),
        ),
        body: Center(
            child: Text(
          "damnnnnnnnn",
          style: TextStyle(fontSize: 50),
        )));
  }
}
