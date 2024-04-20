import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Learn extends StatelessWidget {
  Learn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(
      bottomOpacity: 0,
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor:Colors.white,
      leading: IconButton(
        onPressed: (){Navigator.pop(context);},
        icon:Icon( CupertinoIcons.arrow_left,color: Colors.black, size:35,),
      ),
      title: Text('Learn',
        style: TextStyle(
          fontSize: 30 ,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ),
        body: SingleChildScrollView(
          child: Column(
            children:[
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Positioned(
                    // articleskeJ (122:1125)
                    left: 100,
                    top: 10,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          //width: 58,
                          //height: 19,
                          child: Text(
                            'Articles',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              height: 1.2125,
                              color: Color(0xff26a6fe),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,top: 10),
                  child: Positioned(
                    // articleskeJ (122:1125)
                    left: 100,
                    top: 10,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          //width: 58,
                          //height: 19,
                          child: Text(
                            'Videos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              height: 1.2125,
                              color: Color(0xff26a6fe),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,top: 10),
                  child: Positioned(
                    // articleskeJ (122:1125)
                    left: 100,
                    top: 10,
                    child: Center(
                      child: Align(
                        child: SizedBox(
                          //width: 58,
                          //height: 19,
                          child: Text(
                            'Podcast',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              height: 1.2125,
                              color: Color(0xff26a6fe),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 30),
              child: Container(
                // autogroupav8aeNJ (86zYpfvbESbLv4RcnrAV8A)
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 36),
                  width: double.infinity,
                  height: 250,
                child:Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                Container(
                // autogroupi2nzxtn (86zYvRG1p73SrYedVPi2Nz)
                margin: EdgeInsets.fromLTRB(0, 0, 48, 0),
                width: 170,
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      // frame16k6 (122:1129)
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 153,
                        height: 248,
                        decoration: BoxDecoration (
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Align(
                          // studentsapril600x4001oPc (122:1131)
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 172.5,
                            height: 115,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/student-/images/image1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // financialsupporttomakedentalst (122:1138)
                      left: 6,
                      top: 139,
                      child: Align(
                        child: SizedBox(
                          width: 128,
                          height: 73,
                          child: Text(
                            'Financial support to make dental studies more accessible\n',
                            style: TextStyle(

                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              height: 1.2125,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )


        ),
              Container(
                // autogrouptztiYVc (86zZ1kSTyUR8py9WaDTZti)
                  width: 153,
                  height: double.infinity,
                  child: Stack(
                      children: [
                        Positioned(
                          // frame26X8 (122:1134)
                          left: 0,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(9, 148, 8, 0),
                            width: 153,
                            height: 250,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Align(
                              // confrontingracialmisconception (122:1137)
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                child: Container(
                                  constraints: BoxConstraints (
                                    maxWidth: 136,
                                  ),
                                  child: Text(
                                    'Confronting racial misconceptions within dentistry\n\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      height: 1.2125,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // solaoct23qg (122:1140)
                          left: 0,
                          top: 0,
                          child: Align(
                            child: SizedBox(
                              width: 153,
                              height: 115,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/student-/images/sola-oct-2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                  ),
              ),
                    ],

                ),
              ),

            ),
              Container(
                // frame3MLa (122:1132)
                margin: EdgeInsets.fromLTRB(0, 0, 201, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
                width: 153,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogrouppcp8RbL (86zZv96qU7PX2ejEFTpcP8)
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 42),
                      width: double.infinity,
                      child: Center(
                        // dentistsjan1y74 (122:1141)
                        child: SizedBox(
                          width: 153,
                          height: 115,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/student-/images/image2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // theyoungdentistsshapingthefutu (122:1139)
                      margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                      constraints: BoxConstraints (
                        maxWidth: 142,
                      ),
                      child: Text(
                        'The young dentists shaping the future of dental care\n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1.2125,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]

    )
        )
              );
   // ))])));

    }}