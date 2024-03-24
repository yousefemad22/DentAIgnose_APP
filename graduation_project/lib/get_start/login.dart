
import 'package:flutter/material.dart';
import 'package:graduation_project/get_start/welcome.dart';
import 'package:graduation_project/receptionist/reciptionist_login.dart';
import 'package:graduation_project/student/home.dart';
import 'package:graduation_project/student/student_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1bade1),Color(0xFF26a6fe),Color(0xFF9de8fc)
                ]


            )

        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80, left: 35),
                  // padding: EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0XFF005d9a)),
                  width: 230,
                  height: 70,
                  child: Center(
                    child: Text(
                      'Login as',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w700,),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 45, ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.white,
                  ),
                  height: 500,
                  width: 300,
                  child: Column(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Image(
                        image: AssetImage('images/logo2.png'),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Welcome();
                              }));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: 2,
                          ),


                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue),
                          alignment: Alignment.center,
                          // child: Center(
                          child: Text(
                            'Doctor',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500,),
                          ),
                          //),
                          height: 60,
                          width: 190,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => student_login(),));
                        },
                        child: Container(
                          //padding: EdgeInsets.only(top: 4),
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
                          width: 190,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => reciptionist_login(),));
                        },
                        child: Container(
                          //padding: EdgeInsets.only(top: 4),
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
                          width: 190,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}