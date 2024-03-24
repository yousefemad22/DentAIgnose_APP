import 'package:flutter/material.dart';
  class Learn extends StatelessWidget {
  const Learn({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50,top: 40),
              child: Text('Learn',style: TextStyle(fontSize: 35,color:Colors.black,fontWeight: FontWeight.w700,),),
            ),
            Row(

            )



          ],
        ),
      ),
    );

  }}