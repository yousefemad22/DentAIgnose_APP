import 'package:flutter/material.dart';
import 'package:graduation_project/get_start/welcome.dart';
import 'package:graduation_project/receptionist/reciptionist_login.dart';
import 'package:graduation_project/student/home.dart';
import 'package:graduation_project/student/student_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the size of the current screen
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1bade1), Color(0xFF26a6fe), Color(0xFF9de8fc)
                ]
            )
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.1, left: screenSize.width * 0.1, right: screenSize.width * 0.1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0XFF005d9a)),
                  width: screenSize.width * 0.8,
                  height: 70,  // Fixed height as it is a small element
                  child: Center(
                    child: Text(
                      'Login as',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w700,),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: screenSize.width * 0.12, right: screenSize.width * 0.12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.white,
                  ),
                  height: screenSize.height * 0.7,
                  width: screenSize.width * 0.85,
                  child: Column(
                    children: [
                      Spacer(),
                      Image(
                        image: AssetImage('images/logo2.png'),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Welcome();
                              }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue),
                          alignment: Alignment.center,
                          child: Text(
                            'Dentist',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500,),
                          ),
                          height: 60,
                          width: 190, // Consider making this relative to screen size
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => student_login(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue),
                          alignment: Alignment.center,
                          child: Text(
                            'Student',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w500,),
                          ),
                          height: 60,
                          width: 190, // Consider making this relative to screen size
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => reciptionist_login(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue),
                          alignment: Alignment.center,
                          child: Text(
                            'Receptionist',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w500,),
                          ),
                          height: 60,
                          width: 190, // Consider making this relative to screen size
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
