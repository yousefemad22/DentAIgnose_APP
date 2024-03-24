import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/Drawer.dart';
import 'package:graduation_project/appbar/appbar.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/overView.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';


class dentistPage extends StatefulWidget {
  const dentistPage({super.key});

  @override
  State<dentistPage> createState() => _dentistPageState();
}

class _dentistPageState extends State<dentistPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const Drawer(
            child: drawer()),
        body: ListView(
          children: [
            const appbar(),
            sectionTitle(title: 'Reports'),
            const divider(),
            const allReports(),
            sectionTitle(title: 'Overview'),
            const divider(),
            const overView(),
          ],
        ),
        bottomNavigationBar: const navigationbar(),
      ),
    );
  }
}

