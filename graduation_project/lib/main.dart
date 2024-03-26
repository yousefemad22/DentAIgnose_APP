import 'package:flutter/material.dart';
import 'package:graduation_project/Edit_profile/edit_profile.dart';
import 'package:graduation_project/dentist/docto_profile.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/get_start/create_account.dart';
import 'package:graduation_project/get_start/learn.dart';
import 'package:graduation_project/get_start/login.dart';
import 'package:graduation_project/get_start/start.dart';
import 'package:graduation_project/get_start/welcome.dart';
import 'package:graduation_project/notification/notification.dart';
import 'package:graduation_project/password/Set_new_password.dart';
import 'package:graduation_project/password/check_new_password.dart';
import 'package:graduation_project/password/forget_password.dart';
import 'package:graduation_project/receptionist/home.dart';
import 'package:graduation_project/student/home.dart';
import 'package:graduation_project/student/student_profile.dart';
import 'package:graduation_project/student/widget/all_Reports_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  final MaterialColor customPrimarySwatch = MaterialColor(
    0xff21a9f0,
    <int, Color>{
      50: Color(0xffe3f3fc),
      100: Color(0xffb7e0f7),
      200: Color(0xff8ad1f2),
      300: Color(0xff5dbfe9),
      400: Color(0xff3aaee1),
      500: Color(0xff21a9f0),
      600: Color(0xff1c9cf3),
      700: Color(0xff1790f5),
      800: Color(0xff1283f7),
      900: Color(0xff0a6ff9),
    },
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Start(),
    );
  }
}

