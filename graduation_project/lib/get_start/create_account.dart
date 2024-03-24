
import 'package:flutter/material.dart';

class Create_account extends StatelessWidget {
  const Create_account({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1bade1),Color(0xFF26a6fe),Color(0xFF9de8fc)
                ]


            )

        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only( top: 150,right: 200),
                child:
                Text(

                  'Create',
                  style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w700,

                  ),
                ),),

              Padding(
                padding: EdgeInsets.only(
                    right: 170,bottom: 50
                ),
                child:
                Text(
                  'account',
                  style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w700,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 240,bottom: 10,left: 15),
                child:Text(
                  'Your Name',
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.w700,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: 18, right: 18),
                child: SizedBox(
                    height: 40,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(


                        //iconColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          //icon: Icons.mail,
                          //hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 3, left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    )),),





              Padding(
                padding: const EdgeInsets.only(right: 240,bottom: 10,top: 15,left: 15),
                child: Text(
                  'Your Email',
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.w700,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: 18, right: 18),
                child: SizedBox(
                    height: 40,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(


                        //iconColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          //icon: Icons.mail,
                          //hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 3, left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    )),),

              Padding(
                padding: const EdgeInsets.only(right: 240,bottom: 10,top: 15,left: 15),
                child: Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.w700,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: 18, right: 18),
                child: SizedBox(
                    height: 40,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(


                        //iconColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter your new Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          //icon: Icons.mail,
                          //hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 3, left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    )),),

              Padding(
                padding: const EdgeInsets.only(right: 135,bottom: 10,top: 15),
                child: Text(
                  'Confirm Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.w700,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: 18, right: 18),
                child: SizedBox(
                    height: 40,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(


                        //iconColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Re-enter Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          //icon: Icons.mail,
                          //hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(top: 3, left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    )),),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25,top: 30),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w700,),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 180,top: 30),
                    child: Icon(
                      Icons.login,
                      size: 40,
                      color: Colors.white,
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
}