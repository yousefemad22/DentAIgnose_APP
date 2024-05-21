import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model_report.dart';

class report extends StatelessWidget {
  const report({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 470;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff4aa4ff),
          bottomOpacity: 10,
          elevation: 10,
          toolbarHeight: fem * 120,
          leading: Container(
            margin: EdgeInsets.fromLTRB(12 * fem, 35 * fem, 0 * fem, 30 * fem),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Report',
                  style: TextStyle(
                    fontSize: 25 * fem,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  'April 16 ,2024',
                  style: TextStyle(
                    fontSize: 17 * fem,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          leadingWidth: double.infinity,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 40*fem),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    width: 50*fem,
                    height: 60*fem,
                  ),
                  SizedBox(height: 0.5*fem),
                  Text(
                    'DentAIgnose',
                    style: TextStyle(
                      fontSize: 15*fem,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0*fem),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15 * fem, 5 * fem, 15 * fem, 10 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(12 * fem, 15 * fem, 0 * fem, 5 * fem),
                child: Text(
                  'Patient info',
                  style: TextStyle(
                    color: Color(0xff4aa4ff),
                    fontSize: 21 * fem,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) => _cardsreport(
                  fem: fem,
                  ffem: ffem,
                  Name: data[index].name,
                  Gender: data[index].gender,
                  Number: data[index].number,
                  Age: data[index].age,
                  index: index,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12 * fem, 15 * fem, 0 * fem, 5 * fem),
                child: Text(
                  'History',
                  style: TextStyle(
                    color: Color(0xff4aa4ff),
                    fontSize: 21 * fem,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(

                padding:
                EdgeInsets.fromLTRB(0 * fem, 10 * fem, 0 * fem, 10 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(10 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(5 * fem, 5 * fem),
                      blurRadius: 5 * fem,
                    ),


                  ],
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: info.length,
                  itemBuilder: (context, index) => _cardsquestions(
                    fem: fem,
                    ffem: ffem,
                    question: info[index].question,
                    answer: info[index].answer,
                    index: index,
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                    EdgeInsets.fromLTRB(12 * fem, 15 * fem, 0 * fem, 5 * fem),
                    child: Text(
                      'Investigations',
                      style: TextStyle(
                        color: Color(0xff4aa4ff),
                        fontSize: 21 * fem,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(7 * fem, 10 * fem, 11 * fem, 15 * fem),
                    padding: EdgeInsets.fromLTRB(35 * fem, 15 * fem, 1 * fem, 7 * fem),
                    width: double.infinity,
                    height: 200 ,

                    decoration: BoxDecoration (

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25*fem),
                      boxShadow: [
                        BoxShadow(blurStyle: BlurStyle.solid,
                          color:Colors.blue.shade300,
                          offset: Offset(10*fem, 10*fem),
                          blurRadius: 20*fem,
                        ),
                      ],
                    ),
                    child: Image.asset('assets/s1.png'),

                  ),
                ],
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                    EdgeInsets.fromLTRB(12 * fem, 15 * fem, 0 * fem, 5 * fem),
                    child: Text(
                      'Diagnosis',
                      style: TextStyle(
                        color: Color(0xff4aa4ff),
                        fontSize: 21 * fem,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(
                        7 * fem, 10 * fem, 11 * fem, 15 * fem),
                    padding:
                    EdgeInsets.fromLTRB(15 * fem, 15 * fem, 1 * fem, 7 * fem),
                    width: double.infinity,
                    height: 80 * fem,
                    decoration: BoxDecoration(
                      color:  Color(0xff4aa4ff),
                      borderRadius: BorderRadius.circular(10 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(5 * fem, 10 * fem),
                          blurRadius: 5 * fem,
                        ),


                      ],
                    ),
                    child: Text(
                      'Needs root canal treatment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Approve',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(fem * 170, fem * 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(fem * 5)),
                      backgroundColor: Color(0xff4aa4ff),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(fem * 170, fem * 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(fem * 5)),
                      backgroundColor: Color(0xff4aa4ff),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _cardsreport(
      {required double fem,
        required double ffem,
        required String Name,
        required String Gender,
        required String Number,
        required String Age,
        required int index}) {
    return Container(
      margin: EdgeInsets.fromLTRB(7 * fem, 10 * fem, 11 * fem, 15 * fem),
      padding: EdgeInsets.fromLTRB(35 * fem, 15 * fem, 1 * fem, 7 * fem),
      width: double.infinity,
      height: 200 * fem,

      decoration: BoxDecoration (

        color: Colors.white,
        borderRadius: BorderRadius.circular(25*fem),
        boxShadow: [
          BoxShadow(blurStyle: BlurStyle.solid,
            color:Colors.blue.shade300,
            offset: Offset(10*fem, 10*fem),
            blurRadius: 20*fem,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Name : $Name',
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 2,
            ),
          ),
          Text(
            'Gender : $Gender',
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 2,
            ),
          ),
          Text(
            'Number : $Number',
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 2,
            ),
          ),
          Text(
            'Age : $Age',
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Container _cardsquestions(
      {required double fem,
        required double ffem,
        required String question,
        required String answer,
        required int index}) {
    return Container(
      margin: EdgeInsets.fromLTRB(7 * fem, 10 * fem, 11 * fem, 1 * fem),
      padding: EdgeInsets.fromLTRB(10 * fem, 15 * fem, 1 * fem, 7 * fem),
      width: double.infinity,
      height: 80 * fem,
      decoration: BoxDecoration(
        color:Color(0xff4aa4ff),
        borderRadius: BorderRadius.circular(12 * fem),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(10 * fem, 2 * fem),
            blurRadius: 2 * fem,
          ),

        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            answer,
            style: TextStyle(
              fontSize: 20 * ffem,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
