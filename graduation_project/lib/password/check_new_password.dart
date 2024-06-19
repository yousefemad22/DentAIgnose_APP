import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1bade1), Color(0xFF26a6fe), Color(0xFF9de8fc)]),
        image: DecorationImage(
            image: AssetImage("images/لوجو.png"),
            opacity: 0.3,
            alignment: Alignment.center),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            // size: 25,
                            color: Color(0xFF1A7AC5),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/لوجو.png"),
                          width: screenWidth * 0.2,
                          // height: screenHeight * .1,
                        ),
                        Text(
                          "Dentalgnose",
                          style: TextStyle(
                            fontSize: screenWidth * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * .08,
              ),
              Text(
                "Check your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * .08,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Text(
                  "We sent a reset link to contact@dscode...com \n enter 5 digit "
                  "code that mentioned in the email ",
                  style: TextStyle(
                    color: Color(0xFFD9D6D6),
                    fontSize: screenWidth * .03,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: screenWidth*0.05,right: screenWidth*0.05 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white,
                                width: screenWidth * .005,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 7, right: 7, bottom: 12),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                              width: 1.3,
                              color: Colors.white,
                            )))),
                          )),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(screenWidth * 0.5, screenHeight * 0.05),
                      alignment: Alignment.center),
                  child: Text(
                    "Verify Code",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                 Text(
                  "Haven't got the email yet?",
                  style: TextStyle(
                      fontSize: screenWidth* .03, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child:  Text(
                    "Resend Code",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontSize: screenWidth*0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
