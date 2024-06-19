import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/reports/Reportpage.dart';
import 'package:graduation_project/student/widget/model_reports.dart';
import 'package:graduation_project/student/widget/deatails.dart';
import 'package:firebase_database/firebase_database.dart';

// Page that contains all reports and every one is treated like link to each one seprated in whole page for more info about it
class Report extends StatefulWidget {
  Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late DatabaseReference _databaseReference;
  int? reportsIndex = 3;
  List? data;

  @override
  void initState() {
    super.initState();
    // index for saving choices
    _initializeReportData();
  }

  Future<void> _initializeReportData() async {
    await getAllReportData();
    print("after Report Data is loaded");
    setState(() {}); // Update the state after data is loaded
  }

  Future<void> getAllReportData() async {
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("reports").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      reportsIndex = des != null ? des.length : 0;
      // print(des.length);
      print(reportsIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.8;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          toolbarHeight: fem * 60,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
              size: fem * 35,
            ),
            iconSize: fem * 52,
          ),
          title: GestureDetector(
            onTap: () {
              setState() {}
              ;
            },
            child: Text(
              'All Reports',
              style: TextStyle(
                fontSize: 25 * ffem,
                // fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(18 * fem, 10 * fem, 11 * fem, 3 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              FutureBuilder<List<ReportsModel?>>(
                future: reportsPrevData(reportsIndex!), // Call your method here
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error damnnnnn: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var report = data[index];
                        return _cardsReport(
                          context: context,
                          fem: fem,
                          ffem: ffem,
                          metaData: report!,
                          index: index,
                        );
                      },
                    );
                  } else {
                    return Text("No data available");
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  GestureDetector _cardsReport(
      {required context,
      required double fem,
      required double ffem,
      required var metaData,
      required int index}) {
    if (metaData == null) {
      return GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text(
            "damn",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ); // or some other placeholder
    } else {
      print(metaData);
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => report(reportId: index)));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(7 * fem, 0 * fem, 11 * fem, 15 * fem),
          padding: EdgeInsets.fromLTRB(12 * fem, 8 * fem, 1 * fem, 7 * fem),
          width: double.infinity,
          height: 70 * fem,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10 * fem),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
            ],
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/news 2.png',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: fem * 190,
                          child: Text(
                            metaData.fName != null
                                ? "Patient: ${metaData.fName} ${metaData.mName} ${metaData.lName}"
                                : "Anonymous Patient",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          )),
                      Text(
                        // "By ${metaData!.user + " " + metaData!.userFname + " " + metaData!.userMname + " " + metaData!.userLname}",
                        "By ",
                        style: TextStyle(
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w700,
                          color: Color(0x68000000),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(Icons.arrow_forward_ios_sharp,
                        color: Color(0xff4aa4ff), size: fem * 50),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
