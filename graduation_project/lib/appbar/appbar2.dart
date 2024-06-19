import 'package:flutter/material.dart';

String capitalizeWords(String text) {
  return text.split(" ").map((str) => str[0].toUpperCase() + str.substring(1).toLowerCase()).join(" ");
}
class appbar2 extends StatelessWidget implements PreferredSizeWidget {
  final Map userData;
  appbar2({super.key, required this.userData});


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal:screenSize.width*0.03 ),
            height: screenSize.height*0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.8),
                  // spreadRadius:5,
                  blurRadius: 50,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
          ),
          Positioned(
            child: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('images/3403753 1.png'),
                      ),
                      Text(
                        capitalizeWords("${userData['fName'] + " " + userData['lName']}"),
                        style: TextStyle(
                          fontSize: screenSize.width*0.04,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26A6FE),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo2.png',
                        width: screenSize.width*0.15,
                      ),
                       Text('DentAIgnose',
                          style: TextStyle(
                              fontSize: screenSize.width*0.03,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF26A6FE)))
                    ],
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(70.0);
}
