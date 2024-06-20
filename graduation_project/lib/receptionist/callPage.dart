import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar2.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/overView.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';
import 'package:graduation_project/navigationbar/reciptionistNavigationBar.dart';
import 'package:graduation_project/navigationbar/studentNavigationBar.dart';
import 'package:graduation_project/questiones/patient_Data.dart';
import 'package:graduation_project/student/widget/learnSection.dart';

class receptionCallPage extends StatefulWidget {
  final Map receptionistData;
  const receptionCallPage({super.key, required this.receptionistData});

  @override
  State<receptionCallPage> createState() => _receptionPage();
}

class _receptionPage extends State<receptionCallPage> {
  bool visible_add = true;
  bool visible_add_box = true;
  bool visible_questioniers = false;
  bool visible_questioniers_box = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: reciptionistNavigationBar(receptionistData: widget.receptionistData),
        ),
      ),
    );
  }
}
