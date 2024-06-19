import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/docto_profile.dart';
import 'package:graduation_project/notification/notification.dart';
import 'package:graduation_project/student/student_profile.dart';
import 'package:graduation_project/student/chatbot.dart';

class navigationbar2 extends StatefulWidget {
  final Map userData;
  navigationbar2({super.key, required this.userData});

  @override
  State<navigationbar2> createState() => _navigationbarState();
}

class _navigationbarState extends State<navigationbar2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'images/home.png',
                        width: 32,
                        height: 32,
                        color: _selectedIndex == 0 ? Colors.blue : Colors.black,
                      ),
                      onTap: () {
                        _onItemTapped(0);
                      },
                    ),
                    const Text('Home',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'images/magnifying-glass.png',
                        width: 30,
                        height: 30,
                        color: _selectedIndex == 1 ? Colors.blue : Colors.black,
                      ),
                      onTap: () {
                        _onItemTapped(1);
                      },
                    ),
                    const Text('Search',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                if(widget.userData['email'].endsWith("@intern.com"))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Image.asset(
                          'images/chatbot.png',
                          width: 32,
                          height: 32,
                          color: _selectedIndex == 2 ? Colors.blue : Colors.black,
                        ),
                        onTap: () {
                          _onItemTapped(2);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ));
                        },
                      ),
                      const Text('Chatbot ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                if(!widget.userData['email'].endsWith("@intern.com"))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Image.asset(
                          'images/notification.png',
                          width: 32,
                          height: 32,
                          color: _selectedIndex == 2 ? Colors.blue : Colors.black,
                        ),
                        onTap: () {
                          _onItemTapped(2);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => notification(),
                              ));
                        },
                      ),
                      const Text('Notification ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'images/user.png',
                        width: 32,
                        height: 32,
                        color: _selectedIndex == 3 ? Colors.blue : Colors.black,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => student_profile(studentData: widget.userData),
                            ));
                        _onItemTapped(3);
                      },
                    ),
                    const Text('Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
