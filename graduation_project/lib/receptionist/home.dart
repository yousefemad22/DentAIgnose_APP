import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar2.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/overView.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';
import 'package:graduation_project/navigationbar/reciptionistNavigationBar.dart';
import 'package:graduation_project/questiones/patient_Data.dart';
import 'package:graduation_project/questiones/questionnairePage.dart';
import 'package:graduation_project/receptionist/Xray.dart';
import 'package:graduation_project/student/widget/learnSection.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class receptionPage extends StatefulWidget {
  final Map receptionistData;
  receptionPage({super.key, required this.receptionistData});

  @override
  State<receptionPage> createState() => _receptionPage();
}

class _receptionPage extends State<receptionPage> {
  bool visible_add = true;
  bool visible_add_box = true;
  bool visible_questioniers = false;
  bool visible_questioniers_box = false;

  late DatabaseReference _databaseReference;

  dynamic data;

  // @override
  // void initState() {
  //   super.initState();
  //   // print("inint state");
  //   fetchreceptionistData();
  // }

  // void fetchreceptionistData() {
  //   print("fetch person data");
  //   _databaseReference = FirebaseDatabase.instance.ref("persons");
  //   print("connected");
  //   _databaseReference
  //       .child(widget.receptionistData['id'].toString())
  //       .onValue
  //       .listen((event) {
  //     print("in person");
  //     var des = event.snapshot.value;
  //     setState(() {
  //       data = des;
  //       print("in data");
  //       print(data);
  //       widget.receptionistData["fName"] = data['fName'];
  //       widget.receptionistData["mName"] = data['mName'];
  //       widget.receptionistData["lName"] = data['lName'];
  //       widget.receptionistData["age"] = data['age'];
  //       widget.receptionistData["gender"] = data['gender'];
  //       widget.receptionistData["number"] = data['number'];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
             SizedBox(
              height:screenSize.height*0.05 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      visible_add = false;
                      visible_add_box = false;
                      visible_questioniers = true;
                      visible_questioniers_box = true;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: visible_questioniers,
                        child: Container(
                          width: screenSize.width*0.2,
                          height: screenSize.height*0.12,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100), // Top left corner
                              topRight: Radius.circular(100), // Top right corner
                            ),
                            color: Color(0xff9de8fd),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/questioniers.png',
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                           Text(
                            'Questioniers',
                            style: TextStyle(
                                fontSize: screenSize.width*0.03, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      visible_add = true;
                      visible_add_box = true;
                      visible_questioniers = false;
                      visible_questioniers_box = false;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: visible_add,
                        child: Container(
                          width: screenSize.width*0.2,
                          height: screenSize.height*0.12,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100), // Top left corner
                              topRight: Radius.circular(100), // Top right corner
                            ),
                            color: Color(0xff9de8fd),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/add.png',
                          ),

                           Text(
                            'Add',
                            style: TextStyle(
                                fontSize: screenSize.width*0.03, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: visible_add_box,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: screenSize.width*.9,
                    height: screenSize.height*0.12,
                    decoration: const BoxDecoration(
                      color: Color(0xff9de8fd),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => PatientDataForm(
                                        userData: widget.receptionistData,
                                      ))));
                        },
                        child: Container(
                          width: screenSize.width*0.4,
                          height: screenSize.height*.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              const BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                              const BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Text(
                                'Patient',
                                style: TextStyle(
                                    fontSize: screenSize.width*0.03, fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                'images/patient 1.png',

                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) => Xray())));
                        },
                        child: Container(
                          width: screenSize.width*0.4,
                          height: screenSize.height*.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              const BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                              const BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Text(
                                'X-rays',
                                style: TextStyle(
                                    fontSize: screenSize.width*0.03, fontWeight: FontWeight.bold),
                              ),
                              Image.asset('images/x-ray 1.png')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: visible_questioniers_box,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: screenSize.width*0.9,
                    height: screenSize.height*.12,
                    decoration: const BoxDecoration(
                      color: Color(0xff9de8fd),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Design(userData: widget.receptionistData)));
                    },
                    child: Container(
                      width: screenSize.width*0.8,
                      height: screenSize.height*.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                          const BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Text(
                            'Fill questionnaires',
                            style: TextStyle(
                                fontSize: screenSize.width*0.03, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            'images/question.png',
                            width: screenSize.width*0.1,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(
              height: screenSize.height*0.01,
            ),
            sectionTitle(title: 'Reports'),
            const divider(),
            allReports(),
             SizedBox(
              height: screenSize.height*0.01,
            ),
            sectionTitle(title: 'Overview'),
            const divider(),
            const overView(),
            //  SizedBox(
            //   height: screenSize.height*0.01,
            // ),
          ],
        ),
      ),
    );
  }
}
