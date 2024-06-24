import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/dentistHomes.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/get_start/create_account.dart';
import 'package:graduation_project/password/forget_password.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Welcome extends StatefulWidget {
  Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late DatabaseReference _databaseReference;

  late TextEditingController _email;
  late TextEditingController _password;

  dynamic data;
  int i = 0;

  var allAccounts = [];

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");

    fetchData();
  }

  void fetchData() {
    print("fetch data");
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("accounts").onValue.listen((event) {
      print("in account");
      var des = event.snapshot.value;
      setState(() {
        data = des;
        print("in data");
        while (i < data.length) {
          if (data[i] == null) {
            i++;
          } else {
            print("in while");
            print(data[i]['email']);
            allAccounts.add((data[i]['email'], data[i]['password']));
            i++;
          }
        }
        print(allAccounts);
      });
    });
  }

  void showWrongCredentialsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Wrong email or password. Please try again."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF1bade1),
                Color(0xFF26a6fe),
                Color(0xFF9de8fc)
              ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenSize.width * .05),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back,
                                color: Color(0xFF26A6FE)))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/لوجو.png'),
                        height: screenSize.height * 0.15,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DentAIgnose',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.08,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * .07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .05,
                        vertical: screenSize.height * 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'W e l c o m e',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .05,
                        vertical: screenSize.height * 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'B a c k - D r ...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05,
                        vertical: screenSize.height * 0),
                    child: SizedBox(
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 1,
                        child: TextField(
                          controller: _email,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.mail),

                              //iconColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your Email @dentist.com',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(top: 3, left: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),
                  ),

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
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05,
                        vertical: screenSize.height * 0.01),
                    child: SizedBox(
                        height: screenSize.height * 0.06,
                        width: screenSize.width * 1,
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            return null; // Return null if the input is valid
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(top: 3, left: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.width * 0.01,
                        top: screenSize.height * .0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.6,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => forgetPassword(),
                                ));
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                color: Colors.white),
                            //textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: screenSize.width * .05),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.09,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            //textAlign: TextAlign.start,
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: screenSize.width * .05),
                        child: GestureDetector(
                          onTap: () {
                            bool f = false;

                            Map dentistData = {
                              "id": "",
                              // "dentistId": "",
                              // "accountId": "",
                              "email": "",
                              "password": "",
                              // "personId": "",
                              'fName': "",
                              'mName': "",
                              'lName': "",
                              'age': "",
                              'gender': "",
                              'number': "",
                            };

                            var check = (_email.text, _password.text);

                            // check for account existance
                            for (var i = 0; i < allAccounts.length; i++) {
                              if (check == allAccounts[i]) {
                                f = true;
                                dentistData['id'] = i;
                                dentistData['email'] = _email.text;
                                dentistData['password'] = _password.text;
                              }
                            }
                            // if account exists
                            if (f) {
                              // showWrongCredentialsDialog(context, "Logged in",
                              //     "Intern Student Logged in Successfully.");

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return dentistHomes(dentistData: dentistData);
                                // return dentistPage(dentistData: dentistData);
                              }));
                            } else {
                              // if not exist
                              showWrongCredentialsDialog(context);
                            }
                            _email.text = "";
                            _password.text = "";
                          },
                          child: Icon(
                            Icons.login,
                            size: screenSize.width * .1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: screenSize.width * 0.01,
                            top: screenSize.height * .01),
                        child: Text(
                          "Don't have account?",
                          style: TextStyle(
                              fontSize: screenSize.width * .045,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: screenSize.width * 0.02,
                            top: screenSize.height * .01),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Create_account(
                                user: "dentists",
                              );
                            }));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontSize: screenSize.width * 0.045,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
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
