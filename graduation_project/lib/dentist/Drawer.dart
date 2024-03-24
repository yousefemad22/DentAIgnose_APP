import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/get_start/login.dart';
import 'package:graduation_project/notification/notification.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(top: 50, left: 20),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                    NetworkImage('https://example.com/avatar.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Ahmed Hassan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        'Doctor',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.white, // Set the color of the divider
              thickness: .5, // Set the thickness of the divider
              indent: 50, // Set the indent (left padding) of the divider
              endIndent:
              50, // Set the end indent (right padding) of the divider
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return dentistPage();
                      }));
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return notification();
                      }));
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.white, // Set the color of the divider
              thickness: 1, // Set the thickness of the divider
              indent: 50, // Set the indent (left padding) of the divider
              endIndent:
              50, // Set the end indent (right padding) of the divider
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.person_rounded,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " Receptionist",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Image.asset(
                      'images/doctor.png',
                      width: 40,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Intern Student",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            const Divider(
              color: Colors.white, // Set the color of the divider
              thickness: 1, // Set the thickness of the divider
              indent: 50, // Set the indent (left padding) of the divider
              endIndent:
              50, // Set the end indent (right padding) of the divider
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
                child: Row(
                  children: [
                    Image.asset(
                      'images/logout.png',
                      width: 40,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Logout",
                      style: TextStyle(fontSize: 18),
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
