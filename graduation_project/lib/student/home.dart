import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar2.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';
import 'package:graduation_project/navigationbar/reciptionistNavigationBar.dart';
import 'package:graduation_project/questiones/questionnairePage.dart';
import 'package:graduation_project/student/widget/learnSection.dart';
import 'package:graduation_project/receptionist/Xray.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class studentPage extends StatefulWidget {
  final Map studentData;
  const studentPage({super.key, required this.studentData});

  @override
  State<studentPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentPage> {
  bool visible_add = true;
  bool visible_add_box = true;
  bool visible_questioniers = false;
  bool visible_questioniers_box = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: screenSize.height * 0.05,
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
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100), // Top left corner
                              topRight:
                                  Radius.circular(100), // Top right corner
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
                          Text(
                            'Questioniers',
                            style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold),
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
                          width: screenSize.width * 0.3,
                          height: screenSize.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100), // Top left corner
                              topRight:
                                  Radius.circular(100), // Top right corner
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
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold),
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
                    // margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.0),
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.12,
                    decoration: BoxDecoration(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Xray(userData: widget.studentData))));
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'X-rays',
                        style: TextStyle(
                            fontSize: screenSize.width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset('images/x-ray 1.png')
                    ],
                  )
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
                    width: screenSize.width * .9,
                    height: screenSize.height * 0.12,
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
                      // print('fill');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  Design(userData: widget.studentData))));
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffffffff),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Fill questionnaires',
                        style: TextStyle(
                            fontSize: screenSize.width * .045,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'images/question.png',
                        width: screenSize.width * 0.1,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            sectionTitle(title: 'Learn'),
            learnsection(),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            sectionTitle(title: 'Reports'),
            allReports(),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
