import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:graduation_project/dentist/dentistHomes.dart';
import 'package:graduation_project/receptionist/callPage.dart';
import 'package:graduation_project/student/callPage.dart';

//import '../utils.dart';

class Edit_Profile extends StatefulWidget {
  final Map userData;

  Edit_Profile({super.key, required this.userData});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

void showWrongCredentialsDialog(
    BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: title == "Error"
            ? const Color.fromARGB(255, 252, 90, 79)
            : Color(0xff0a6ff9),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xff1c9cf3))),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}

class _Edit_ProfileState extends State<Edit_Profile> {
  TextEditingController _fullName = TextEditingController(text: "");

  TextEditingController _email = TextEditingController(text: "");

  TextEditingController _number = TextEditingController(text: "");

  String? currentProfile;

  @override
  void initState() {
    super.initState();

    _fullName.text = widget.userData['fName'] +
        " " +
        widget.userData['mName'] +
        " " +
        widget.userData['lName'];
    _email.text = widget.userData['email'];
    _number.text = widget.userData['number'].toString();

    if (_email.text.endsWith("@dentist.com")) {
      currentProfile = "dentist";
    } else if (_email.text.endsWith("@intern.com")) {
      currentProfile = "student";
    } else {
      currentProfile = "receptionist";
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          // toolbarHeight: fem*60,
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
          title: Text(
            'Edit Profile ',
            style: TextStyle(
              fontSize: 25 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6 * fem),
                  width: double.infinity,
                  height: 276 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 390 * fem,
                          height: 212 * fem,
                          child: Container(
                            decoration: BoxDecoration(color: Color(0xff21a9f0)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 120 * fem,
                        top: 138 * fem,
                        child: Container(
                            width: 140 * fem,
                            height: 140 * fem,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              backgroundImage:
                                  AssetImage('assets/profile/doctor.png'),
                              radius: 30 * fem,
                            )),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 41 * fem),
                    child: Text(
                      'Change picture ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  // Added container with size constraints
                  constraints: BoxConstraints(
                      maxWidth: 390 * fem), // Adjust constraints as needed
                  child: Column(
                    children: [
                      createFormField(
                          'Full Name', _fullName, 'Enter your name', fem, ffem),
                      createFormField(
                          'E-mail', _email, 'Enter your email', fem, ffem),
                      createFormField('Phone Number', _number,
                          'Enter your number', fem, ffem),
                      ElevatedButton(
                        onPressed: () async {
                          if (_email.text.isEmpty ||
                              _fullName.text.isEmpty ||
                              _number.text.isEmpty) {
                            showWrongCredentialsDialog(
                                context, "Error", "Fields cannot be empty.");
                          } else if (_email.text.endsWith("@dentist.com") ||
                              _email.text.endsWith("@intern.com") ||
                              _email.text.endsWith("@receptionist.com")) {
                            DatabaseReference ref = FirebaseDatabase.instance
                                .ref("persons")
                                .child(widget.userData['id'].toString());
                            List<String> speratedName =
                                _fullName.text.split(" ");
                            ref.update({
                              "fName": speratedName[0],
                              "mName": speratedName[1],
                              "lName": speratedName[2],
                              "number": int.parse(_number.text),
                              // "gender": _genderController.text,
                              // "age": int.parse(_ageController.text),
                            });

                            DatabaseReference ref2 = FirebaseDatabase.instance
                                .ref("accounts")
                                .child(widget.userData['id'].toString());
                            ref2.update({
                              "email": _email.text,
                            });
                            widget.userData['fName'] = speratedName[0];
                            widget.userData['mName'] = speratedName[1];
                            widget.userData['lName'] = speratedName[2];
                            widget.userData['number'] = int.parse(_number.text);

                            widget.userData['email'] = _email.text;

                            showWrongCredentialsDialog(context, "Updated",
                                "Data Updated Successfully :).");

                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              if (currentProfile == "dentist") {
                                return dentistHomes(
                                    dentistData: widget.userData);
                              } else if (currentProfile == 'intern') {
                                return studentCallPage(
                                    studentData: widget.userData);
                              } else {
                                return receptionCallPage(
                                    receptionistData: widget.userData);
                              }
                            }));
                          } else {
                            // print("in else");
                            showWrongCredentialsDialog(context, "Error",
                                "Email must ends with @$currentProfile.com.");
                          }
                        },
                        child: Text(
                          'Update',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff0a6ff9),
                          minimumSize: Size(fem * 170, fem * 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(fem * 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget createFormField(String labelText, TextEditingController initialValue,
    String hintText, double fem, double ffem) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.fromLTRB(20 * fem, 2 * fem, 20 * fem, 10 * fem),
        child: Text(
          labelText,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15 * ffem,
            fontWeight: FontWeight.w700,
            height: 1.2125 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(20 * fem, 7 * fem, 20 * fem, 5 * fem),
        width: double.infinity,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 13 * fem, vertical: 8 * fem),
          height: fem * 45,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0x7f000000)),
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10 * fem),
          ),
          child: TextFormField(
            controller: initialValue,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2125 * ffem / fem,
              color: Color(0xff000000),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2125 * ffem / fem,
                color: Color(0x7f000000),
              ),
            ),
          ),
        ),
      )
    ],
  );
}
