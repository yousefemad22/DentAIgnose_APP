import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/student/widget/model_reports.dart';
import 'package:graduation_project/student/widget/deatails.dart';
class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      home: Scaffold(
            appBar:AppBar(
              bottomOpacity: 0,
              elevation: 0,
              toolbarHeight: fem*60,
              backgroundColor:Colors.white,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:Icon( CupertinoIcons.arrow_left,color: Colors.black,
                  size:fem*35,
                ),
                iconSize: fem*52,
              ),
              title: Text('All Reports ',
                style: TextStyle(
                  fontSize: 25 * ffem,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            body:  SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(18 * fem, 10 * fem, 11 * fem, 3 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 36 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFd9d9d9),
                            borderRadius: BorderRadius.circular(150 * fem)
                        ),
                        child: TextFormField(onChanged: (val){
                          log(val);
                        },
                          style: TextStyle( fontSize: fem*25,fontWeight: FontWeight.w500,color: Color(0xff20aaee)),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(150 * fem),
                              borderSide:
                              BorderSide(color: Color(0xff20aaee), width: fem*3),
                            ),
                            prefixIcon:  Icon(
                              Icons.search,size: fem*35,
                              color: Color(0xFF161616),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical:fem*0.2),
                            hintText: 'Find Report',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 17 * fem,fontWeight: FontWeight.w500
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(150 * fem),
                                borderSide:  BorderSide(color: Color(0xff20aaee), width: fem*3)
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context,index)=>  _cardsReport(fem: fem, ffem: ffem, name: data[index].name
                              , date: data[index].datesend,index: index)
                      ),
      
                    ]
                ),
              ),
            ),
      
      
      ),
    );
  }

  Container _cardsReport({ required double fem, required double ffem,required String name,required String date,required int index}) {
    return Container(
      margin: EdgeInsets.fromLTRB(7 * fem, 0 * fem, 11 * fem, 15 * fem),
      padding: EdgeInsets.fromLTRB(12 * fem, 8 * fem, 1 * fem, 7 * fem),
      width: double.infinity,
      height: 70 * fem,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10 * fem),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2 * fem,
          ),
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2 * fem,
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                'images/news 2.png',
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: fem*190,
                    child: Text(
                      name,softWrap:true,
                      overflow:TextOverflow.ellipsis ,
                      style: TextStyle(
                        fontSize: 15 * fem,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w700,
                      color: Color(0x68000000),
                    ),
                  ),

                ],
              ),
              IconButton(
                onPressed: (){
                  Get.to(detials(index:index,));
                  log('index as int');

                },padding: EdgeInsets.fromLTRB(20* fem, 0 * fem, 0 * fem, 25* fem),
                icon: Icon(Icons.arrow_forward_ios_sharp,
                    color: Color(0xff4aa4ff),size: fem*50),
                iconSize: fem*40,
              ),

            ],
          ),

        ],
      ),
    );
  }

}
