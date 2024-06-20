import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/dentist/dentistHomes.dart';
import 'package:graduation_project/dentist/home.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Create_account extends StatefulWidget {
  final String user;
  Create_account({super.key, required this.user});

  @override
  State<Create_account> createState() => _Create_accountState();
}

class _Create_accountState extends State<Create_account> {
  TextEditingController _fName = TextEditingController(text: null);

  TextEditingController _mName = TextEditingController(text: null);

  TextEditingController _lName = TextEditingController(text: null);

  TextEditingController _number = TextEditingController(text: null);

  String? _gender;

  TextEditingController _age = TextEditingController(text: null);

  TextEditingController _email = TextEditingController(text: null);

  TextEditingController _password = TextEditingController(text: null);

  TextEditingController _rePassword = TextEditingController(text: null);

  late DatabaseReference _databaseReference;
  int? index, dentistIndex;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("persons").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      index = des == null ? 0 : des.length;
      print(index);
    });
    _databaseReference.child(widget.user).onValue.listen((event) {
      dynamic des = event.snapshot.value;
      dentistIndex = des == null ? 0 : des.length;
      print(dentistIndex);
    });
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
            ]),
          image: DecorationImage(
              image: AssetImage("images/لوجوs.png"),
              opacity: 0.3,
              alignment: Alignment.center),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenSize.height*0.05),
                    child: Text(
                      widget.user.capitalize.toString()+" account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.height*0.04,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: screenSize.width*0.05),
                        child: Text(
                          'Name',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: screenSize.width*0.06,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenSize.width*0.04),
                        child: customTextFieldInSizedBox(
                            "First Name", _fName, screenSize.width*0.3, false),
                      ),
                      Padding(
                        // padding: EdgeInsets.only(left: 18, right: 18),
                        padding: EdgeInsets.only(),
                        child: customTextFieldInSizedBox(
                            "Middle Name", _mName, screenSize.width*0.3, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only( right: screenSize.width*0.04),
                        child: customTextFieldInSizedBox(
                            "Last Name", _lName, screenSize.width*0.3, false),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height*0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Age',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: screenSize.width*.06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left:screenSize.width*0.05 ),
                            child: customTextFieldInSizedBox(
                                "Age", _age, screenSize.width*0.3, false),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                                fontSize: screenSize.width*.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: screenSize.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Radio<String>(
                                  value: 'Male',
                                  fillColor: MaterialStatePropertyAll(Colors.white),
                                  activeColor: Color(0xff1c9cf3),
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                Text(
                                  'Male',
                                  style:
                                      TextStyle(color: Colors.white, fontSize: screenSize.width*0.04),
                                ),
                                Radio<String>(
                                  fillColor: MaterialStatePropertyAll(Colors.white),
                                  activeColor: Color(0xff1c9cf3),
                                  value: 'Female',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                Text(
                                  'Female',
                                  style:
                                      TextStyle(color: Colors.white, fontSize: screenSize.width*0.04),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height*0.04,
                  ),
                  Text(
                    'Number',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenSize.width*.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  customTextFieldInSizedBox(
                      "Number", _number, screenSize.width*0.9, false),
                  SizedBox(
                    height: screenSize.height*0.04,
                  ),
                  Text(
                    'Email',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenSize.width*0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  customTextFieldInSizedBox("Email", _email, screenSize.width*0.9, false),
                  SizedBox(
                    height: screenSize.height*0.04,
                  ),
                  Text(
                    'Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenSize.width*0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  customTextFieldInSizedBox(
                      "New Password", _password, screenSize.width*0.9, true),
                  SizedBox(
                    height: screenSize.height*0.04,
                  ),
                  Text(
                    'Confirm Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenSize.width*0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  customTextFieldInSizedBox(
                      "New Password again", _rePassword, screenSize.width*0.9, true),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.05 ,vertical: screenSize.height*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: screenSize.width*0.07,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.login,
                            size: 40,
                            color: Colors.white,
                          ),
                          onTap: () {
                            if (_email.text == "" ||
                                _password.text == "" ||
                                _rePassword.text == "" ||
                                _fName.text == "" ||
                                _lName.text == "") {
                              showWrongCredentialsDialog(context, "Error",
                                  "Text Fields cannot be empty.");
                            } else if (widget.user == "dentists" &&
                                !_email.text.endsWith("@dentist.com")) {
                              showWrongCredentialsDialog(context, "Error",
                                  "Email must ends with @dentist.com.");
                            } else if (widget.user == "students" &&
                                !_email.text.endsWith("@intern.com")) {
                              showWrongCredentialsDialog(context, "Error",
                                  "Email must ends with @intern.com.");
                            } else if (widget.user == "receptionists" &&
                                !_email.text.endsWith("@receptionist.com")) {
                              showWrongCredentialsDialog(context, "Error",
                                  "Email must ends with @receptionist.com.");
                            } else if (_password.text != _rePassword.text) {
                              showWrongCredentialsDialog(context, "Error",
                                  "Passwword and RePassword Must be equal.");
                            } else {
                              DatabaseReference ref = FirebaseDatabase.instance
                                  .ref("accounts/${index.toString()}");
                              ref.set({
                                "email": _email.text,
                                "password": _password.text,
                              });

                              DatabaseReference ref2 = FirebaseDatabase.instance
                                  .ref("persons/${index.toString()}");
                              ref2.set({
                                "fName": _fName.text,
                                "mName": _mName.text,
                                "lName": _lName.text,
                                "number": int.parse(_number.text),
                                "gender": _gender,
                                "age": int.parse(_age.text),
                              });

                              DatabaseReference ref3 = FirebaseDatabase.instance
                                  .ref(
                                      "${widget.user}/${dentistIndex.toString()}");
                              ref3.set({
                                "accountId": index.toString(),
                                "personId": index.toString(),
                              });

                              Map dentistData = {
                                "id": index.toString(),
                                // "dentistId": dentistIndex.toString(),
                                // "accountId": index.toString(),
                                "email": _email.text,
                                "password": _password.text,
                                // "personId": index.toString(),
                                'fName': _fName.text,
                                'mName': _mName.text,
                                'lName': _lName.text,
                                'age': _age.text,
                                'gender': _gender,
                                'number': _number.text,
                              };

                              showWrongCredentialsDialog(context, "Added",
                                  "${widget.user.capitalize} Registerd Successfully :).");

                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return dentistHomes(dentistData: dentistData);
                              }));
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox customTextFieldInSizedBox(
      hint, _controller, double width, visability) {
    return SizedBox(
        height: 40,
        width: width,
        child: TextField(
          controller: _controller,
          obscureText: visability,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.only(top: 3, left: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ));
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
