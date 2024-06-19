import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar.dart';
import 'package:graduation_project/dentist/Drawer.dart';
import 'package:graduation_project/dentist/dentistHomes.dart';
import 'package:graduation_project/dentist/docto_profile.dart';
import 'package:graduation_project/dentist/home.dart';
import 'package:graduation_project/notification/notification.dart';
import 'package:graduation_project/student/student_profile.dart';


class navigationbar extends StatefulWidget {
  final Map dentistData;
  navigationbar({super.key, required this.dentistData});

  @override
  State<navigationbar> createState() => _navigationbarState();
}

class _navigationbarState extends State<navigationbar> {
  int _selectedIndex = 0;
  late DatabaseReference _databaseReference;
  dynamic data;

  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(dentistData: widget.dentistData),
      SearchPage(),
      NotificationPage(),
      DentistProfile(dentistData: widget.dentistData),
    ];
    fetchDentistData();
  }

  void fetchDentistData() {
    print("fetch person data");
    _databaseReference = FirebaseDatabase.instance.ref("persons");
    print("connected");
    _databaseReference
        .child(widget.dentistData['id'].toString())
        .onValue
        .listen((event) {
      print("in person");
      var des = event.snapshot.value;
      // print(des.toString());
      setState(() {
        data = des;
        print("in data");
        print(data);
        widget.dentistData["fName"] = data['fName'];
        widget.dentistData["mName"] = data['mName'];
        widget.dentistData["lName"] = data['lName'];
        widget.dentistData["age"] = data['age'];
        widget.dentistData["gender"] = data['gender'];
        widget.dentistData["number"] = data['number'];
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
    return SafeArea(
      child: Scaffold(
        appBar: appbar(dentistData: widget.dentistData),
        // drawer: drawer(dentistData: widget.dentistData),
        drawer: Drawer(
            child: drawer(
          dentistData: widget.dentistData,
        )),
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
                    buildNavItem('images/notification.png', 'Notification', 2),
                    buildNavItem('images/user.png', 'Profile', 3),
                  ],
                ),
              ),
            ),
          ],
        ),
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
  final Map dentistData;
  HomePage({required this.dentistData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dentistPage(dentistData: dentistData),
    );
  }
}

class SearchPage extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // body: Center(child: Text('Search Page')),
      body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.05
            ),
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
      body: notification(),
    );
  }
}

class DentistProfile extends StatelessWidget {
  final Map dentistData;
  DentistProfile({required this.dentistData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: doctor_Profile(dentistData: dentistData),
      body: student_profile(studentData: dentistData),
    );
  }
}
