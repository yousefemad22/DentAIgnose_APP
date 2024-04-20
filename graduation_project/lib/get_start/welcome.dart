import 'package:flutter/material.dart';
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
          print("in while");
          print(data[i]['email']);
          allAccounts.add((data[i]['email'], data[i]['password']));
          i++;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                        width: 200,
                        height: 200,
                        child: Image(image: AssetImage('images/لوجو.png'))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 70),
                    child: Text(
                      'DentAIgnose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(left: 6),
                      child: const Text(
                        'W e l c o m e',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(left: 6),
                      child: const Text(
                        'B a c k - D r ...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: SizedBox(
                        height: 40,
                        width: 350,
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
                    padding: EdgeInsets.only(top: 10, left: 18, right: 18),
                    child: SizedBox(
                        height: 40,
                        width: 350,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => forgetPassword(),
                          ));
                    },
                    child: const Padding(
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
                      const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 30, bottom: 10, left: 20),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              //textAlign: TextAlign.start,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 180, top: 30),
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
                                return dentistPage(dentistData: dentistData);
                              }));
                            } else {
                              // if not exist
                              showWrongCredentialsDialog(context);
                            }
                            _email.text = "";
                            _password.text = "";
                          },
                          child: const Icon(
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Create_account(user: "dentists",);
                            }));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 25,
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
