import 'package:flutter/material.dart';
import 'package:graduation_project/password/Set_new_password.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.lightBlue,
        ]),
        image: DecorationImage(
          image: AssetImage("images/لوجو.png"),
          opacity: 0.2,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.cyan,
                            ),
                            backgroundColor: Colors.white,
                            radius: 27,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 175.0,
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage(
                            "images/لوجو.png",
                          ),
                          height: 100,
                          width: 100.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Text('Forget Password ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                        'Please enter your e-mail to reset the password.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(.7),
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Text('Your e-mail ',
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        hintText: 'Enter your e-mail'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: FilledButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        fixedSize: const Size(200, 50),
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Set_new_password(),));
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(color: Colors.black87, fontSize: 15),
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
