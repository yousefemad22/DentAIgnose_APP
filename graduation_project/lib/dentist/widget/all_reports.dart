import 'package:flutter/material.dart';
import 'package:graduation_project/student/widget/all_Reports_page.dart';

class allReports extends StatefulWidget {
  const allReports({super.key});

  @override
  State<allReports> createState() => _allReportsState();
}

class _allReportsState extends State<allReports> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Report()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 106,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 20,
              offset: const Offset(-1, 15),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/news 2.png',
              width: 65,
              height: 65,
            ),
            Text(
              'All Reports ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff26a6fe)),
            ),
            SizedBox(
              width: 100,
            ),
            Image.asset(
              'images/right-arrow 2.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
