import 'package:flutter/material.dart';
import 'package:graduation_project/dentist/widget/divider.dart';
import 'package:graduation_project/dentist/widget/perday.dart';

class overView extends StatefulWidget {
   const overView({super.key});
  @override
  State<overView> createState() => _overViewState();
}

class _overViewState extends State<overView> {
  final int perday=19 ;
  final int total=350 ;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin:  EdgeInsets.symmetric(horizontal: screenSize.width*0.05, vertical: screenSize.height*0.01),
      width: double.infinity,
      height: screenSize.height*0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // make it circular
        border: Border.all(
          color: const Color(0xFF26A6FE), // specify the border color
          width: 1, // specify the border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.8),
            blurRadius: 20,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ovColumn(img: 'images/patient 1.png',num: '$perday', range: 'Per day'),
          const verticalDivider(),
          ovColumn(img: 'images/patients.png',num: '$total', range: 'total'),
        ],
      ),
    );
  }
}




