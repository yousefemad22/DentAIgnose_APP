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

  dentistPage({required this.dentistData});

  @override
  State<dentistPage> createState() => _dentistPageState();
}

class _dentistPageState extends State<dentistPage> {
  late DatabaseReference _databaseReference;

  dynamic data;

  @override
  void initState() {
    super.initState();
    // print("inint state");
    fetchDentistData();
  }

  void fetchDentistData() {
    print("fetch person data");
    _databaseReference = FirebaseDatabase.instance.ref("persons");
    print("connected");
    _databaseReference.child(widget.dentistData['id'].toString()).onValue.listen((event) {
      print("in person");
      var des = event.snapshot.value;
      setState(() {
        data = des;
        print("in data");
        print(data);
        widget.dentistData["fName"] = data['fName'];
        widget.dentistData["mName"] = data['mName'];
        widget.dentistData["lName"] = data['lName'];
        widget.dentistData["age"] = data['age'];
        widget.dentistData["gender"] = data['gender'];
        widget.dentistData["number"] = data['number'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var index;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
            child: drawer(
          dentistData: widget.dentistData,
        )),
        body: ListView(
          children: [
            appbar(
              dentistData: widget.dentistData,
            ),
            sectionTitle(title: 'Reports'),
            const divider(),
            const allReports(),
            sectionTitle(title: 'Overview'),
            const divider(),
            const overView(),
          ],
        ),
        bottomNavigationBar: navigationbar(dentistData: widget.dentistData),
      ),
    );
  }
}
