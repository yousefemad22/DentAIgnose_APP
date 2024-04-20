import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/Edit_profile/edit_profile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/get_start/create_account.dart';

class doctor_Profile extends StatefulWidget {
  final Map dentistData;
  doctor_Profile({required this.dentistData});

  @override
  State<doctor_Profile> createState() => _doctor_ProfileState();
}

class _doctor_ProfileState extends State<doctor_Profile> {
  // late DatabaseReference _databaseReference;

  // int? password;
  // String email = "";

  // dynamic data;

  // void main() {
  //   print("fetch person data");
  //   _databaseReference = FirebaseDatabase.instance.ref("Account");
  //   print("connected");
  //   _databaseReference.child(widget.dentistData['id'].toString()).onValue.listen((event) {
  //     print("in account");
  //     var des = event.snapshot.value;
  //     setState(() {
  //       data = des;
  //       print("in data");
  //       print(data);
  //       email = data['email'];
  //       password = data['[password]'];

  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      home: Scaffold(
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
          ),
          title: Text(
            'Profile ',
            style: TextStyle(
              fontSize: 25 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 14 * fem, 10 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 10 * fem, 0 * fem, 25 * fem),
                  // padding:
                  //     EdgeInsets.fromLTRB(20 * fem, 10 * fem, 4 * fem, 10 * fem),
                  width: double.infinity,
                  height: 75 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                    gradient: LinearGradient(
                      begin: Alignment(-1.486, -2.933),
                      end: Alignment(1, 4.093),
                      colors: <Color>[
                        Color(0xff26a6fe),
                        Color(0xff1bade1),
                        Color(0xff9de8fc)
                      ],
                      stops: <double>[0, 0.616, 1],
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/profile/doctor.png',
                        ),
                        radius: fem * 26,
                        backgroundColor: Color(0xffe3e2e7),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 65, 8),
                        width: 155 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${widget.dentistData['fName'][0].toUpperCase()}${widget.dentistData['fName'].substring(1)} ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18 * ffem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${widget.dentistData['lName'][0].toUpperCase()}${widget.dentistData['lName'].substring(1)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18 * ffem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.dentistData['email'],
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 11 * fem,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Edit_Profile(
                                      userData: widget.dentistData)));
                        },
                        icon: Icon(
                          Icons.border_color_outlined,
                          size: fem * 32,
                        ),
                      ),
                    ],
                  ),
                ),
                buildTextContainer("Staff", ffem, fem),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4 * fem),
                  padding:
                      EdgeInsets.fromLTRB(10 * fem, 8 * fem, 7 * fem, 2 * fem),
                  width: double.infinity,
                  height: 152 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(15 * fem),
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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Create_account(user: "receptionists"),
                              ));
                        },
                        child: buildCustomRow(
                          text: "Add Receptionist",
                          icon1: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: fem * 30,
                          ),
                          icon2: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.black,
                            size: fem * 30,
                          ),
                          fem: fem,
                          ffem: ffem,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Create_account(user: "students"),
                              ));
                        },
                        child: buildCustomRow(
                          text: 'Add Intern Student',
                          icon1: Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                            size: fem * 30,
                          ),
                          icon2: Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.black,
                            size: fem * 30,
                          ),
                          fem: fem,
                          ffem: ffem,
                        ),
                      ),
                    ],
                  ),
                ),
                buildTextContainer("Settings", ffem, fem),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 4 * fem, 0 * fem, 4 * fem),
                  padding:
                      EdgeInsets.fromLTRB(10 * fem, 8 * fem, 7 * fem, 2 * fem),
                  width: double.infinity,
                  height: 228 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
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
                  child: Column(
                    children: [
                      buildCustomRow(
                        text: "Language",
                        icon1: Icon(Icons.language,
                            color: Colors.black, size: fem * 30),
                        icon2: Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                          size: fem * 30,
                        ),
                        fem: fem,
                        ffem: ffem,
                      ),
                      buildCustomRow(
                        text: 'Darkmode',
                        icon1: Icon(CupertinoIcons.moon_fill,
                            color: Colors.black, size: fem * 30),
                        icon2: Icon(CupertinoIcons.right_chevron,
                            color: Colors.black, size: fem * 30),
                        fem: fem,
                        ffem: ffem,
                      ),
                      buildCustomRow(
                        text: 'Change Password',
                        icon1: Icon(Icons.key_rounded,
                            color: Colors.black, size: fem * 30),
                        icon2: Icon(CupertinoIcons.right_chevron,
                            color: Colors.black, size: fem * 30),
                        fem: fem,
                        ffem: ffem,
                      ),
                    ],
                  ),
                ),
                buildTextContainer("More", ffem, fem),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4 * fem),
                  padding:
                      EdgeInsets.fromLTRB(10 * fem, 8 * fem, 7 * fem, 2 * fem),
                  width: double.infinity,
                  height: 152 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
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
                  child: Column(
                    children: [
                      buildCustomRow(
                        text: "Help & Support",
                        icon1: Icon(CupertinoIcons.question_circle_fill,
                            color: Colors.black, size: fem * 30),
                        icon2: Icon(CupertinoIcons.right_chevron,
                            color: Colors.black, size: fem * 30),
                        fem: fem,
                        ffem: ffem,
                      ),
                      buildCustomRow(
                        text: 'About Us',
                        icon1: Icon(CupertinoIcons.exclamationmark_circle,
                            color: Colors.black, size: fem * 30),
                        icon2: Icon(CupertinoIcons.right_chevron,
                            color: Colors.black, size: fem * 30),
                        fem: fem,
                        ffem: ffem,
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

Widget buildTextContainer(String text, double ffem, double fem) {
  return Container(
    margin: EdgeInsets.fromLTRB(2 * fem, 4 * fem, 0 * fem, 4 * fem),
    width: double.infinity,
    child: Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 17 * ffem,
        fontWeight: FontWeight.w900,
        height: 1.2125 * ffem / fem,
        color: Color(0xff000000),
      ),
    ),
  );
}

Widget buildCustomRow({
  required String text,
  required Icon icon1,
  required Icon icon2,
  required double fem,
  required double ffem,
}) {
  return Container(
    margin: EdgeInsets.fromLTRB(2 * fem, 2 * fem, 0 * fem, 1 * fem),
    height: 68 * fem,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //margin: EdgeInsets.only(right: 18 * fem),
            width: 40 * fem,
            height: 40 * fem,
            decoration: BoxDecoration(
              color: Color(0x66808080),
              borderRadius: BorderRadius.circular(20 * fem),
            ),
            child: icon1,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20 * fem, 23 * fem, 0 * fem, 0 * fem),
            width: 180 * fem,
            height: double.infinity,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 19 * ffem,
                fontWeight: FontWeight.bold,
                height: 1.2125 * ffem / fem,
                color: Color(0xff000000),
              ),
            ),
          ),
          /* Container(
            margin: EdgeInsets.fromLTRB(60 * fem, 18 * fem, 0 * fem, 5 * fem),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30 * fem,
                  height: 30 * fem,
                  child:icon2,
                ),
              ],
            ),
          ),*/
          IconButton(
            onPressed: () {},
            icon: icon2,
            padding: EdgeInsets.fromLTRB(60 * fem, 11 * fem, 0 * fem, 5 * fem),
          )
        ],
      ),
    ),
  );
}
