import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/Edit_profile/edit_profile.dart';
import 'package:graduation_project/get_start/login.dart';
import 'package:graduation_project/receptionist/allReceptionists.dart';

class student_profile extends StatelessWidget {
  final Map studentData;
  student_profile({required this.studentData});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 14 * fem, 10 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      margin: EdgeInsets.fromLTRB(
                          15 * fem, 10 * fem, 65 * fem, 8 * fem),
                      width: 155 * fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            studentData['fName'] + " " + studentData['lName'],
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000),
                            ),
                          ),
                          Text(
                            studentData['email'],
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 12 * ffem,
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
                                      userData: studentData,
                                    )));
                      },
                      icon: Icon(
                        Icons.border_color_outlined,
                        size: fem * 32,
                      ),
                    ),
                  ],
                ),
              ),
              buildTextContainer("Additionals", ffem, fem),
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 4 * fem, 0 * fem, 4 * fem),
                padding:
                    EdgeInsets.fromLTRB(10 * fem, 8 * fem, 7 * fem, 2 * fem),
                width: double.infinity,
                // height: 228 * fem,
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
                    studentData['email'].endsWith("@dentist.com") ||
                            studentData['email'].endsWith("@receptionist.com")
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          All_reciptionist(who: "persons")));
                            },
                            child: buildCustomRow(
                              text: "All Patient",
                              icon1: Icon(Icons.group_rounded,
                                  color: Colors.black, size: fem * 30),
                              icon2: Icon(
                                CupertinoIcons.right_chevron,
                                color: Colors.black,
                                size: fem * 30,
                              ),
                              fem: fem,
                              ffem: ffem,
                            ),
                          )
                        : const SizedBox(
                            height: 1,
                          ),
                    studentData['email'].endsWith("@dentist.com")
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => All_reciptionist(
                                          who: "receptionists")));
                            },
                            child: buildCustomRow(
                              text: 'All Receptionists',
                              icon1: Icon(Icons.person_3_sharp,
                                  color: Colors.black, size: fem * 30),
                              icon2: Icon(CupertinoIcons.right_chevron,
                                  color: Colors.black, size: fem * 30),
                              fem: fem,
                              ffem: ffem,
                            ),
                          )
                        : SizedBox(
                            height: 1,
                          ),
                    studentData['email'].endsWith("@dentist.com")
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          All_reciptionist(who: "students")));
                            },
                            child: buildCustomRow(
                              text: 'All Interns',
                              icon1: Icon(CupertinoIcons.person_2,
                                  color: Colors.black, size: fem * 30),
                              icon2: Icon(CupertinoIcons.right_chevron,
                                  color: Colors.black, size: fem * 30),
                              fem: fem,
                              ffem: ffem,
                            ),
                          )
                        : SizedBox(
                            height: 1,
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
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4 * fem),
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
                    // buildCustomRow(
                    //   text: "Help & Support",
                    //   icon1: Icon(CupertinoIcons.question_circle_fill,
                    //       color: Colors.black, size: fem * 30),
                    //   icon2: Icon(CupertinoIcons.right_chevron,
                    //       color: Colors.black, size: fem * 30),
                    //   fem: fem,
                    //   ffem: ffem,
                    // ),
                    buildCustomRow(
                      text: 'About Us',
                      icon1: Icon(CupertinoIcons.exclamationmark_circle,
                          color: Colors.black, size: fem * 30),
                      icon2: Icon(CupertinoIcons.right_chevron,
                          color: Colors.black, size: fem * 30),
                      fem: fem,
                      ffem: ffem,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: buildCustomRow(
                        text: 'Log out',
                        icon1: Icon(Icons.logout,
                            color: Colors.black, size: fem * 30),
                        icon2: Icon(CupertinoIcons.right_chevron,
                            color: Colors.black, size: fem * 30),
                        fem: fem,
                        ffem: ffem,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                fontSize: 15 * ffem,
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
          Container(
            child: icon2,
            padding: EdgeInsets.fromLTRB(60 * fem, 11 * fem, 0 * fem, 5 * fem),
          )
        ],
      ),
    ),
  );
}
