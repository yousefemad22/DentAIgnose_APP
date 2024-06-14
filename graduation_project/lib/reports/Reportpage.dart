import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/appbar/appbar3.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/questiones/questionnaireComponents.dart';
import 'model_report.dart';
import 'package:graduation_project/appbar/appbar2.dart';

// Page that contains every report separately with details
class report extends StatefulWidget {
  dynamic reportId;

  report({required this.reportId});

  @override
  State<report> createState() => _ReportState();
}

class _ReportState extends State<report> {
  Map<String, dynamic>? reportMap = {};
  Map<String, dynamic>? patientData = {};
  Map<String, dynamic>? choicesMap = {};
  Map<String, dynamic>? userData = {};
  dynamic prediction = "", xrayImageURL = "";

  late Future<void> _loadingFuture;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _loadingFuture = _initializeReportData();
  }

  Future<void> _initializeReportData() async {
    await getAllReportData(widget.reportId);
  }

  Future<void> getAllReportData(int reportIndex) async {
    DatabaseReference reportsReference =
        FirebaseDatabase.instance.ref("reports");
    DatabaseReference personsReference =
        FirebaseDatabase.instance.ref("persons");
    DatabaseReference xRaysReference = FirebaseDatabase.instance.ref("x-rays");
    DatabaseReference choicesReference =
        FirebaseDatabase.instance.ref("choices");

    await reportsReference
        .child(reportIndex.toString())
        .get()
        .then((snapshot) async {
      dynamic des = snapshot.value;
      if (des != null) {
        if (des['receptionistId'] != null) {
          DataSnapshot recData = await personsReference
              .child(des['receptionistId'].toString())
              .get();
          userData = {
            'fName': recData.child('fName').value,
            'mName': recData.child('mName').value,
            'lName': recData.child('lName').value,
            'age': recData.child('age').value,
            'gender': recData.child('gender').value,
            'number': recData.child('number').value,
          };
        }

        if (des['patientId'] != null) {
          DataSnapshot patData =
              await personsReference.child(des['patientId'].toString()).get();
          patientData = {
            'fName': patData.child('fName').value,
            'mName': patData.child('mName').value,
            'lName': patData.child('lName').value,
            'age': patData.child('age').value,
            'gender': patData.child('gender').value,
            'number': patData.child('number').value,
          };
        }

        if (des['x-rayId'] != null) {
          DataSnapshot xRayData =
              await xRaysReference.child(des['x-rayId'].toString()).get();
          xrayImageURL = xRayData.child("imagePath").value;
          prediction = xRayData.child("pred").value;
        }

        if (des['choiceId'] != null) {
          DataSnapshot choicesData =
              await choicesReference.child(des['choiceId'].toString()).get();
          choicesMap = {
            for (int i = 0; i < 8; i++) '$i': choicesData.child("$i").value,
            'diagnoses': choicesData.child("diagnoses").value,
            'description': choicesData.child("description").value,
          };
        }
        setState(
            () {}); // This is crucial to update the UI after data is fetched
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 470;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return FutureBuilder(
      future: _loadingFuture, // This will call the method to load the data
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // Check if the future is resolved
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Build the UI once the data is loaded
            return Scaffold(
              appBar: appbar3(
                title: "Report",
                backColor: Colors.blue,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 5 * fem, 15 * fem, 10 * fem),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (patientData!['fName'] != null)
                        Column(
                          children: [
                            sectionTitle(title: 'Patient info'),
                            const divider(),
                            shadowedBox(
                              fem: fem,
                              childWidget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  pateintInfo(
                                      ffem: ffem,
                                      stat: "Name",
                                      dynam: capitalizeWords(
                                          "${patientData!['fName']} ${patientData!['mName']} ${patientData!['lName']}")),
                                  pateintInfo(
                                      ffem: ffem,
                                      stat: "Gender",
                                      dynam: patientData!['gender']),
                                  pateintInfo(
                                      ffem: ffem,
                                      stat: "Number",
                                      dynam: "0${patientData!['number']}"),
                                  pateintInfo(
                                      ffem: ffem,
                                      stat: "Age",
                                      dynam: patientData!['age'].toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      //------------------------------------------------------------------done----------------
                      if (xrayImageURL != "")
                        Column(
                          children: [
                            sectionTitle(title: 'Investigations'),
                            const divider(),
                            // shadowedBox(
                            //     fem: fem, childWidget: Image.file(xrayImage!)),
                            shadowedBox(
                                fem: fem,
                                childWidget: Image.network(
                                  xrayImageURL!,
                                )),
                          ],
                        ),
                      //------------------------------------------------------------------done----------------
                      if (choicesMap != {})
                        Column(
                          children: [
                            sectionTitle(title: 'Questionnaire Result'),
                            const divider(),
                            shadowedBox(
                              fem: fem,
                              childWidget: Text(
                                choicesMap!['description'].toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.blue),
                              ),
                            ),
                            // shadowedBox(
                            //     fem: fem, childWidget: Text(choicesMap!["0"].toString())),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff26a6fe)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  child: Text(_isVisible
                                      ? 'Hide Questionnaire Answers'
                                      : 'Show Questionnaire Answers'),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: _isVisible,
                              child: shadowedBox(
                                fem: fem,
                                childWidget: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: questions.length,
                                  itemBuilder: (context, index) =>
                                      _cardsquestions(
                                    fem: fem,
                                    ffem: ffem,
                                    question: questions[index]['question'],
                                    answer: choicesMap!["$index"],
                                    index: index,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      //------------------------------------------------------------------done----------------
                      if (choicesMap != null &&
                          choicesMap!['diagnoses'] !=
                              "") // that's if there was no questionnaire at all or if diagnose is empty
                        Column(
                          children: [
                            sectionTitle(title: 'Diagnoses'),
                            const divider(),
                            shadowedBox(
                              fem: fem,
                              childWidget: Center(
                                child: Text(
                                  choicesMap!['diagnoses'].toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff26a6fe),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(fem * 170, fem * 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(fem * 5)),
                              backgroundColor: Color(0xff26a6fe),
                            ),
                            child: Text(
                              'Approve',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(fem * 170, fem * 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(fem * 5)),
                              backgroundColor: Color(0xff26a6fe),
                            ),
                            child: Text(
                              '${widget.reportId}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        } else {
          // Show a loading spinner while waiting for the data
          return Scaffold(
            appBar: appbar3(
              title: "Report",
              backColor: Colors.blue,
            ),
            body: const Center(
              child: CircularProgressIndicator(color: Color(0xff26a6fe),),
            ),
          );
        }
      },
    );
  }

  Container _cardsreport(
      {required double fem,
      required double ffem,
      required String Name,
      required String Gender,
      required String Number,
      required String Age,
      required int index}) {
    return Container(
      margin: EdgeInsets.fromLTRB(7 * fem, 10 * fem, 11 * fem, 15 * fem),
      padding: EdgeInsets.fromLTRB(35 * fem, 15 * fem, 1 * fem, 7 * fem),
      width: double.infinity,
      height: 200 * fem,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25 * fem),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.solid,
            color: Colors.blue.shade300,
            offset: Offset(10 * fem, 10 * fem),
            blurRadius: 20 * fem,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pateintInfo(ffem: ffem, stat: "Name", dynam: Name),
          pateintInfo(ffem: ffem, stat: "Gender", dynam: Gender),
          pateintInfo(ffem: ffem, stat: "Number", dynam: Number),
          pateintInfo(ffem: ffem, stat: "Age", dynam: Age),
        ],
      ),
    );
  }

  RichText pateintInfo(
      {required double ffem, required String stat, required String dynam}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$stat: ", // Static part
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 2,
            ),
          ),
          TextSpan(
            text: dynam, // Dynamic part
            style: TextStyle(
              fontSize: 18 * ffem,
              fontWeight: FontWeight.w400, // Different style for the name
              color: Colors.blue, // Different color for the name
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Container _cardsquestions({
    required double fem,
    required double ffem,
    required String question,
    required String answer,
    required int index,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 5 * fem),
      padding: EdgeInsets.fromLTRB(10 * fem, 15 * fem, 10 * fem, 15 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff26a6fe),
        borderRadius: BorderRadius.circular(12 * fem),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(62, 113, 141, 255),
            offset: Offset(10 * fem, 2 * fem),
            blurRadius: 2 * fem,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q. $question",
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "  -  $answer",
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Column shadowedBox({required double fem, required Widget childWidget}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20 * fem, 20 * fem, 20 * fem, 20 * fem),
          padding: EdgeInsets.fromLTRB(20 * fem, 15 * fem, 20 * fem, 15 * fem),
          width: double.infinity,
          // height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25 * fem),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.solid,
                color: Colors.blue.shade300,
                offset: Offset(10 * fem, 10 * fem),
                blurRadius: 20 * fem,
              ),
            ],
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 300 * fem, // Set the maximum height here
            ),
            child: SingleChildScrollView(
              child: childWidget,
            ),
          ),
          // child: Image.file(xrayImage!),
        ),
      ],
    );
  }
}
