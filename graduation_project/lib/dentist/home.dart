import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/Drawer.dart';
import 'package:graduation_project/appbar/appbar.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/overView.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class dentistPage extends StatefulWidget {
  final Map dentistData;

  dentistPage({super.key, required this.dentistData});

  @override
  State<dentistPage> createState() => _dentistPageState();
}

class _dentistPageState extends State<dentistPage> {


  @override
  void initState() {
    super.initState();
    // print("inint state");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //     child: drawer(
        //       dentistData: widget.dentistData,
        // )),
        // appBar: appbar(
        //   dentistData: widget.dentistData,
        // ),
        body: ListView(
          children: [
            sectionTitle(title: 'Reports'),
            const divider(),
            allReports(),
            sectionTitle(title: 'Overview'),
            const divider(),
            const overView(),
          ],
        ),
    );
  }
}
