import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/dentist/docto_profile.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/get_start/create_account.dart';
import 'package:graduation_project/get_start/login.dart';
import 'package:graduation_project/notification/notification.dart';
import 'package:graduation_project/receptionist/allReceptionists.dart';

class drawer extends StatelessWidget {
  final Map dentistData;

  drawer({super.key, required this.dentistData});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF26A6FE),
                Color(0xFF1BADE1),
                Color(0xFF9DE8FC),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.05, left: screenSize.width*0.04),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: screenSize.width*0.09,
                    backgroundImage:
                        NetworkImage('https://example.com/avatar.jpg'),
                  ),
                  SizedBox(
                    width: screenSize.width*0.05,
                  ),
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: dentistData['fName'][0].toUpperCase() +
                                  dentistData['fName'].substring(1) +
                                  ' ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width*0.05,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: dentistData['lName'][0].toUpperCase() +
                                  dentistData['lName'].substring(1),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width*0.05,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Doctor',
                        style: TextStyle(fontSize: screenSize.width*0.04, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             SizedBox(
              height: screenSize.height*0.04,
            ),
            const Divider(
              color: Colors.white, // Set the color of the divider
              thickness: .5, // Set the thickness of the divider
              indent: 50, // Set the indent (left padding) of the divider
              endIndent:
                  50, // Set the end indent (right padding) of the divider
            ),
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.02, left: screenSize.width*0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return dentistPage(dentistData: dentistData);
                  }));
                },
                child:Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: screenSize.width*0.08,
                    ),
                    SizedBox(
                      width: screenSize.width*.02,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: screenSize.width*0.04),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.02, left: screenSize.width*0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return notification();
                  }));
                },
                child:  Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: screenSize.width*0.08,
                    ),
                    SizedBox(
                      width: screenSize.width*.02,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(fontSize: screenSize.width*0.04),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.02, left: screenSize.width*0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => doctor_Profile(
                          dentistData: dentistData,
                        ),
                      ));
                },
                child:  Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: screenSize.width*0.08,
                    ),
                    SizedBox(
                      width: screenSize.width*.02,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: screenSize.width*0.04),
                    )
                  ],
                ),
              ),
            ),
             SizedBox(
              height: screenSize.height*0.04,
            ),
            const Divider(
              color: Colors.white, // Set the color of the divider
              thickness: 1, // Set the thickness of the divider
              indent: 50, // Set the indent (left padding) of the divider
              endIndent:
                  50, // Set the end indent (right padding) of the divider
            ),
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.02, left: screenSize.width*0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            All_reciptionist(who: "receptionists",),
                      ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           Create_account(user: "receptionists"),
                  //     ));
                },
                child:  Row(
                  children: [
                    Icon(
                      Icons.person_rounded,
                      size: screenSize.width*0.08,
                    ),
                    SizedBox(
                      width: screenSize.width*.02,
                    ),
                    Text(
                      " Receptionist",
                      style: TextStyle(fontSize: screenSize.width*0.04),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.02, left: screenSize.width*0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            All_reciptionist(who: "students",),
                      ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      'images/doctor.png',
                      width:screenSize.width*0.07,
                      // height: 35,
                    ),
                     SizedBox(
                      width: screenSize.width*.04,
                    ),
                     Text(
                      "Intern Student",
                      style: TextStyle(fontSize: screenSize.width*0.04),
                    )
                  ],
                ),
              ),
            ),
             SizedBox(
              height: screenSize.height*0.04,
            ),
            const Divider(
              color: Colors.white, // Set the color of the divider
              thickness: 1, // Set the thickness of the divider
              indent: 50, // Set the indent (left padding) of the divider
              endIndent:
                  50, // Set the end indent (right padding) of the divider
            ),
            Container(
              margin:  EdgeInsets.only(top: screenSize.height*0.02, left: screenSize.width*0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Row(
                  children: [
                    Image.asset(
                      'images/logout.png',
                      width:screenSize.width*0.06,
                      height: 35,
                    ),
                     SizedBox(
                      width: screenSize.width*.02,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: screenSize.width*0.04),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
