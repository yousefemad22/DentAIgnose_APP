import 'package:flutter/material.dart';
import 'package:graduation_project/appbar/appbar2.dart';
import 'package:graduation_project/dentist/widget/all_reports.dart';
import 'package:graduation_project/dentist/widget/section.dart';
import 'package:graduation_project/navigationbar/navigationbar.dart';
import 'package:graduation_project/navigationbar/navigationbar2.dart';
import 'package:graduation_project/student/widget/learnSection.dart';

class studentPage extends StatefulWidget {
  const studentPage({super.key});

  @override
  State<studentPage> createState() => _studentPageState();
}

class _studentPageState extends State<studentPage> {
  bool visible_add=true  ;
  bool visible_add_box=true  ;
  bool visible_questioniers=false  ;
  bool visible_questioniers_box=false  ;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            const appbar2(),
            const SizedBox(height: 30,),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  visible_add = false;
                  visible_add_box = false;
                  visible_questioniers=true;
                  visible_questioniers_box=true;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: visible_questioniers,
                    child: Container(
                      width: 88,
                      height: 101,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100), // Top left corner
                          topRight: Radius.circular(100), // Top right corner
                        ),
                        color: Color(0xff9de8fd),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],

                      ),
                    ),

                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/questioniers.png',),
                      SizedBox(height: 5,),
                      Text('Questioniers',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  )
                ],

              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  visible_add = true;
                  visible_add_box = true;
                  visible_questioniers=false;
                  visible_questioniers_box=false;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: visible_add,
                    child: Container(
                      width: 88,
                      height: 101,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100), // Top left corner
                          topRight: Radius.circular(100), // Top right corner
                        ),
                        color: Color(0xff9de8fd),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                        ],

                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/add.png',),
                      SizedBox(height: 10,),
                      Text('Add',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
            Visibility(
              visible: visible_add_box,
              child: Stack(
                   alignment: Alignment.center,
                   children: [
                     Container(
                       margin: EdgeInsets.symmetric(horizontal: 15),
                       width: 358,
                       height: 108,
                         decoration: BoxDecoration(
                           color: Color(0xff9de8fd),
                           boxShadow: [
                             BoxShadow(
                               color: Color(0x3f000000),
                               offset: Offset(0, 4),
                               blurRadius: 2,
                             ),
                           ],
                         ),
                       ),

                     GestureDetector(
                       onTap: (){
                         print('x-ray');
                       },
                       child: Container(
                         width: 266,
                         height: 66,
                         decoration: BoxDecoration (
                           borderRadius: BorderRadius.circular(10),
                           color: Color(0xffffffff),
                           boxShadow: [
                             BoxShadow(
                               color: Color(0x3f000000),
                               offset: Offset(0, 4),
                               blurRadius: 2,
                             ),
                             BoxShadow(
                               color: Color(0x3f000000),
                               offset: Offset(0 ,4),
                               blurRadius: 2,
                             ),
                           ],
                         ),
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text('X-rays',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                         Image.asset('images/x-ray 1.png')
                       ],
                     )
                   ],
                 ),
            ),
            Visibility(
              visible: visible_questioniers_box,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: 358,
                    height: 108,
                    decoration: BoxDecoration(
                      color: Color(0xff9de8fd),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      print('fill');
                    },
                    child: Container(
                      width: 266,
                      height: 66,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4),
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0 ,4),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Fill questionnaires',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Image.asset('images/question.png',width: 38,height: 43,)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            sectionTitle(title: 'Learn'),
            const learnsection(),
            const SizedBox(height: 15,),
            sectionTitle(title: 'Reports'),
            const allReports(),
            ],
        ),


        bottomNavigationBar: const navigationbar2(),
      ),
    );
  }
}
