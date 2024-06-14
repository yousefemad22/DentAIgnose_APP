import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar2.dart';
import 'package:graduation_project/dentist/docto_profile.dart';
import 'package:graduation_project/notification/notification.dart';
import 'package:graduation_project/student/chatbot.dart';
import 'package:graduation_project/student/home.dart';
import 'package:graduation_project/student/student_profile.dart';

class studentNavigationBar extends StatefulWidget {
  final Map studentData;
  const studentNavigationBar({super.key, required this.studentData});

  @override
  State<studentNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<studentNavigationBar> {
  int _selectedIndex = 0;
  late DatabaseReference _databaseReference;
  dynamic data;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(studentData: widget.studentData),
      SearchPage(),
      ChatbotPage(),
      StudentProfile(studentData: widget.studentData),
    ];
    fetchstudentData();
  }

  void fetchstudentData() {
    print("fetch person data");
    _databaseReference = FirebaseDatabase.instance.ref("persons");
    print("connected");
    _databaseReference
        .child(widget.studentData['id'].toString())
        .onValue
        .listen((event) {
      print("in person");
      var des = event.snapshot.value;
      setState(() {
        data = des;
        print("in data");
        print(data);
        widget.studentData["fName"] = data['fName'];
        widget.studentData["mName"] = data['mName'];
        widget.studentData["lName"] = data['lName'];
        widget.studentData["age"] = data['age'];
        widget.studentData["gender"] = data['gender'];
        widget.studentData["number"] = data['number'];
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2(userData: widget.studentData),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Stack(
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
                  buildNavItem('images/home.png', 'Home', 0),
                  buildNavItem('images/magnifying-glass.png', 'Search', 1),
                  buildNavItem('images/chatbot.png', 'Chatbot', 2),
                  buildNavItem('images/user.png', 'Profile', 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(String assetPath, String label, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Image.asset(
            assetPath,
            width: 32,
            height: 32,
            color: _selectedIndex == index ? Colors.blue : Colors.black,
          ),
          onTap: () {
            _onItemTapped(index);
          },
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  final Map studentData;
  const HomePage({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: studentPage(studentData: studentData),
    );
  }
}

class SearchPage extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text('Search Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Enter a search term',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatBotPage(),
    );
  }
}

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatBotPage(),
    );
  }
}

class StudentProfile extends StatelessWidget {
  final Map studentData;
  const StudentProfile({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: student_profile(studentData: studentData),
    );
  }
}
