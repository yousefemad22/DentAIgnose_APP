import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  final Map dentistData;

  // final Map dentistData;
  appbar({super.key, required this.dentistData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 65.0,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const CircleAvatar(
                //     radius: 25.0,
                //     backgroundImage: AssetImage('images/3403753 1.png')),
                // const SizedBox(
                //   width: 5,
                // ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: dentistData['fName'][0].toUpperCase() +
                            dentistData['fName'].substring(1) +
                            ' ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF26A6FE),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: dentistData['lName'][0].toUpperCase() +
                            dentistData['lName'].substring(1),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF26A6FE),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(
                  width: 90,
                ),
                Column(
                  children: [
                    Image.asset(
                      'images/logo2.png',
                      width: 65,
                      height: 42,
                    ),
                    const Text('DentAIgnose',
                        style: TextStyle(
                            fontSize: 12,
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
    );
  }
}
