import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar2.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';
import 'package:graduation_project/navigationbar/studentNavigationBar.dart';
import 'package:graduation_project/student/widget/learnSection.dart';

class studentCallPage extends StatefulWidget {
  final Map studentData;
  const studentCallPage({super.key, required this.studentData});

  @override
  State<studentCallPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentCallPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: studentNavigationBar(studentData: widget.studentData),
      ),
    );
  }
}
