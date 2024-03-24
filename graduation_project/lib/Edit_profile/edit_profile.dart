import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

//import '../utils.dart';

class Edit_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          bottomOpacity: 0,
          elevation: 0,
          // toolbarHeight: fem*60,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon( CupertinoIcons.arrow_left,color: Colors.black,
              size:fem*35,
            ),
            iconSize: fem*52,
          ),
          title: Text('Edit Profile ',
            style: TextStyle(
              fontSize: 25 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        body:SingleChildScrollView(
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
                            decoration:BoxDecoration(
                                color: Color(0xff21a9f0)
                            ),
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
                              backgroundImage: AssetImage('assets/profile/doctor.png'),
                              radius: 30*fem,
                            )
                        ),
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
                Container( // Added container with size constraints
                  constraints: BoxConstraints(maxWidth: 390 * fem), // Adjust constraints as needed
                  child: Column(
                    children: [
                      createFormField('Username', 'Ahmed Hassan', 'Enter your name', fem, ffem),
                      createFormField('E-mail', 'Ahmed Hassan22@gmail.com', 'Enter your email', fem, ffem),
                      createFormField('Phone Number', '0109963377203', 'Enter your number', fem, ffem),
                      ElevatedButton(onPressed: (){},
                        child: Text(
                          'Update',
                          textAlign: TextAlign.center,
                          style: TextStyle (

                            fontSize: 18*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(fem*170, fem*35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(fem*15)
                          ),

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

Widget createFormField(String labelText, String initialValue, String hintText, double fem, double ffem) {
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
          padding: EdgeInsets.symmetric(horizontal: 13 * fem, vertical: 8 * fem),
          height: fem*45,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0x7f000000)),
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10 * fem),
          ),
          child: TextFormField(
            initialValue: initialValue,
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