import 'package:flutter/material.dart';
import 'package:graduation_project/password/forget_password.dart';
import 'package:graduation_project/receptionist/callPage.dart';
import 'package:graduation_project/receptionist/home.dart';
import 'package:graduation_project/student/home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class reciptionist_login extends StatefulWidget {
  const reciptionist_login({super.key});

  @override
  State<reciptionist_login> createState() => _WelcomeState();
}

class _WelcomeState extends State<reciptionist_login> {
  late DatabaseReference _databaseReference;

  late TextEditingController _email;
  late TextEditingController _password;

  bool _obscureText = true;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // SizedBox(width: 5,),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.arrow_back,
                                  color: Color(0xFF26A6FE)))),
                      // SizedBox(
                      //   width: 20.0,
                      // ),
                      Text(
                        'DentAIgnose',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image(
                        image: AssetImage("images/لوجو.png"),
                        height: 50,
                      ),
                    ]),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'W e l c o m e',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'B a c k ...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.email_outlined),
                      // suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      hintText: 'Email',
                    ),
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    //   onFieldSubmitted: (String value) {
                    //     print(value);
                    //   },
                    //   onChanged: (String value) {
                    //     print(value);
                    //   },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    // onChanged: (String value) {
                    //   print(value);
                    // },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 220,
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
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // const SizedBox(
                    //   width: 30,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          if (!_email.text.endsWith("@receptionist.com")) {
                            _email.text = "";
                            _password.text = "";
                            return showWrongCredentialsDialog(context, "Error",
                                "Email must ends with @receptionist.com");
                          }
                      
                          bool f = false;
                      
                          Map receptionistData = {
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
                              receptionistData['id'] = i;
                              receptionistData['email'] = _email.text;
                              receptionistData['password'] = _password.text;
                            }
                          }
                          // if account exists
                          if (f) {
                            // showWrongCredentialsDialog(context, "Logged in",
                            //     "Intern Student Logged in Successfully.");
                      
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return receptionCallPage(
                                  receptionistData: receptionistData);
                            }));
                            //   return receptionPage(
                            //       receptionistData: receptionistData);
                            // }));
                          } else {
                            // if not exist
                            showWrongCredentialsDialog(
                                context, "Error", "Wrong email or password.");
                          }
                          _email.text = "";
                          _password.text = "";
                        },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
        backgroundColor:
            title == "Error" ? Color(0xFFFC5A4F) : Color(0xff0a6ff9),
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
