import 'package:flutter/material.dart';
import 'package:graduation_project/password/forget_password.dart';
import 'package:graduation_project/receptionist/home.dart';
import 'package:graduation_project/student/home.dart';

class reciptionist_login extends StatefulWidget {
  const reciptionist_login({super.key});

  @override
  State<reciptionist_login> createState() => _WelcomeState();
}

class _WelcomeState extends State<reciptionist_login> {
  var emailConroller=TextEditingController();

  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF258ffd),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage("images/لوجو.png"), height: 150,),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Dentalgnose',
                style: TextStyle(color: Colors.white, fontSize: 37,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'W e l c o m e',
                    style: TextStyle(color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'B a c k ...',
                    style: TextStyle(color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),


              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(
                        Icons.email_outlined
                    ),
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    hintText: 'Email',
                  ),
                  controller: emailConroller,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  onFieldSubmitted:( String value){
                    print( value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon:const Icon(Icons.lock) ,
                    suffixIcon:const Icon(Icons.remove_red_eye,),
                    hintText: 'Password',
                  ),
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted:( String value){
                    print( value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 220,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => forgetPassword(),));
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: const Expanded(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),

                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => receptionPage(),));
                          },
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Colors.cyan,
                            ),
                          ),
                        )
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
