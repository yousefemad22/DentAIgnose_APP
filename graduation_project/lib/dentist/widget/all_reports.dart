import 'package:flutter/material.dart';
import 'package:graduation_project/student/widget/all_Reports_page.dart';

// The bar in the Home Page
class allReports extends StatefulWidget {
  allReports({super.key});

  @override
  State<allReports> createState() => _allReportsState();
}

class _allReportsState extends State<allReports> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
         MaterialPageRoute(builder: ((context) => Report())));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.04),
        // padding: EdgeInsets.all(10),
        width: double.infinity,
        height: screenSize.height*0.12,
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/news 2.png',
                    width: screenSize.width*0.15,
                  ),
                  Text(
                    'All Reports ',
                    style: TextStyle(
                        fontSize: screenSize.width*0.05,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff26a6fe)),
                  ),
                ],

              ),
              Image.asset(
                'images/right-arrow 2.png',
                width: screenSize.width*0.1,
              ),
            ],

          ),
        ),
      ),
    );
  }
}
