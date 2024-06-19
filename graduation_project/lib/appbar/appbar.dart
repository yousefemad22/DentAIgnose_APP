import 'package:flutter/material.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  final Map dentistData;

  // final Map dentistData;
  appbar({super.key, required this.dentistData});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          margin:  EdgeInsets.symmetric(horizontal: screenSize.width*.03),
          height: screenSize.height*0.065,
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
            title: Container(
              margin: EdgeInsets.only(right: screenSize.width*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                          radius: 20.0,
                          backgroundImage: AssetImage('images/3403753 1.png')),
                       SizedBox(
                        width: screenSize.width*0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: dentistData['fName'][0].toUpperCase() +
                                  dentistData['fName'].substring(1) +
                                  ' ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width*0.04,
                                color: Color(0xFF26A6FE),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: dentistData['lName'][0].toUpperCase() +
                                  dentistData['lName'].substring(1),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width*0.04,
                                color: Color(0xFF26A6FE),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/logo2.png',
                        width: screenSize.width*0.1,
                        // height: 42,
                      ),
                       Text('DentAIgnose',
                          style: TextStyle(
                              fontSize: screenSize.width*0.03,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF26A6FE))),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(75.0);
}
