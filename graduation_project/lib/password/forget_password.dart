import 'package:flutter/material.dart';
import 'package:graduation_project/password/Set_new_password.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.cyan,
                          ),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage("images/لوجو.png"),
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.2,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  Container(
                    child: Text(
                      'Forget Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Text(
                      'Please enter your e-mail to reset the password.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    'Your e-mail ',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      hintText: 'Enter your e-mail',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  Center(
                    child: FilledButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        fixedSize: Size(screenWidth * 0.5, screenHeight * 0.07),
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Set_new_password(),
                          ),
                        );
                      },
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
