import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/Drawer.dart';
import 'package:graduation_project/appbar/appbar.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/overView.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';

class dentistHomes extends StatefulWidget {
  
  final Map dentistData;
  const dentistHomes({super.key, required this.dentistData});
  @override
  State<dentistHomes> createState() => _dentistPageState();
}

class _dentistPageState extends State<dentistHomes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: navigationbar(dentistData: widget.dentistData),
        ),
      ),
    );
  }
}
