
import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/get_start/create_account.dart';
import 'package:graduation_project/password/forget_password.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});
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

            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                        width: 200,
                        height: 200,

                        child: Image(image: AssetImage('images/لوجو.png'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Text(
                      'DentAIgnose',
                      style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.w500,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'W e l c o m e',
                        style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'B a c k - D r ...',
                        style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: SizedBox(
                        height: 40,
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: const Icon(Icons.mail),

                              //iconColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(top: 3, left: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),),


                  // Padding(
                  //     padding: EdgeInsets.only(top: 30,bottom: 18,left: 18,right: 18),
                  //     child:
                  // Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(18),
                  //           color: Colors.white,
                  //         ),
                  //         height: 40,
                  //         width: 400,
                  //         child: Row(
                  //           children: [
                  //             Padding(
                  //               padding: EdgeInsets.only(
                  //                 left: 10,
                  //               ),
                  //               child: Icon(
                  //                 Icons.mail,
                  //                 size: 25,
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //
                  //   Padding(
                  //       padding: EdgeInsets.all(18),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(18),
                  //           color: Colors.white,
                  //         ),
                  //         height: 40,
                  //         width: 400,
                  //         child: Row(
                  //           children: [
                  //             Padding(
                  //               padding: EdgeInsets.only(
                  //                 left: 10,
                  //               ),
                  //               child: Icon(
                  //                 Icons.password,
                  //                 size: 25,
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: EdgeInsets.only(
                  //                 left: 30,
                  //               ),
                  //               child: Text(
                  //                 'Password',
                  //                 style: TextStyle(fontSize: 20, color: Colors.grey),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: EdgeInsets.only(left: 140),
                  //               child: Icon(
                  //
                  //
                  //                 Icons.visibility_off,
                  //                 size: 25,
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       )),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 18, right: 18),
                    child: SizedBox(
                        height: 40,
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: const Icon(Icons.password),

                              //iconColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              //icon: Icons.mail,
                              //hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(top: 3, left: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => forgetPassword(),));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        //textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30,bottom: 10,left: 20),
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.w500,),
                              //textAlign: TextAlign.start,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 180,top: 30),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return dentistPage();
                                }));
                          },
                          child: Icon(
                            Icons.login,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Don't have account?",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Create_account();
                                }));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.w500,),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}