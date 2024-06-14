import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:graduation_project/notification/model_notification.dart';

class notification extends StatelessWidget {
  final MessageViewModel viewModel = MessageViewModel();

  notification({super.key});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      // appBar: AppBar(
      //   bottomOpacity: 0,
      //   elevation: 0,
      //   toolbarHeight: fem * 60,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(CupertinoIcons.arrow_left, color: Colors.black,
      //       size: fem * 35,
      //     ),
      //     iconSize: fem * 52,
      //   ),
      //   title: Text('Notification ',
      //     style: TextStyle(
      //       fontSize: 25 * ffem,
      //       fontWeight: FontWeight.w700,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(15 * fem, 5 * fem, 13 * fem, 10 * fem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20 * fem, 0, 42 * fem, 0 * fem),
              width: double.infinity,
              height: 1.5*fem ,
              decoration: const BoxDecoration(
                color: Color(0xff26a6fe),
              ),
            ),
            Expanded(
              child: ListView.builder(

                itemCount: viewModel.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = viewModel.data.keys.elementAt(index);
                  List<Message> messages = viewModel.data[key]!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(1*fem, 15*fem, 0*fem, 5*fem),
                        child: Text(key,style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 21*fem,
                          fontWeight: FontWeight.w800,
                        ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          Message message = messages[index];
                          return cardnotifi(fem: fem,ffem: ffem,date:message.dateSend,time: message.time );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),



          ],
        ),
      ),


    );

  }

  Container cardnotifi({required double fem, required double ffem, required String time ,required String date}) {
    return Container(
      margin: EdgeInsets.fromLTRB(3*fem, 11*fem, 3*fem, 3*fem),
      padding: EdgeInsets.fromLTRB(8*fem, 11*fem, 6*fem, 11*fem),
      width: double.infinity,
      height: 80*fem,
      decoration: BoxDecoration (
        color: Colors.white,
        borderRadius: BorderRadius.circular(8*fem),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0*fem, 4*fem),
            blurRadius: 4*fem,
          ),
        ],
      ),
       child: Row(
          children: [
            Icon(Icons.notifications_active,size:fem*40,color: Color(0xff26a6fe)),
            Container(
              margin: EdgeInsets.fromLTRB(10 * fem, 8 * fem, 0 * fem, 0 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Patient',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'You can see the report....',
                    style: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 8 * fem, 5 * fem, 0 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }}
