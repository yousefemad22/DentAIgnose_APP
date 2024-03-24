import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A7AC5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                          size: 25,
                          color: Color(0xFF1A7AC5),
                        ),
                      )),
                  const Column(
                    children: [
                      Icon(
                        Icons.emoji_emotions,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dentalgnose",
                        style: TextStyle(
                          color: Color(0xFFD9D6D6),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Check your email",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "We sent a reset link to contact@dscode...com \n enter 5 digit "
                "code that mentioned in the email ",
                style: TextStyle(
                  color: Color(0xFFD9D6D6),
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.9,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, bottom: 20),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                            width: 1.3,
                            color: Colors.white,
                          )))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.9,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, bottom: 20),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                            width: 1.3,
                            color: Colors.white,
                          )))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.9,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, bottom: 20),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                            width: 1.3,
                            color: Colors.white,
                          )))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.9,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, bottom: 20),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                            width: 1.3,
                            color: Colors.white,
                          )))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.9,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, bottom: 20),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                            width: 1.3,
                            color: Colors.white,
                          )))),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton(
                onPressed: () {

                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    alignment: Alignment.center,
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 55, vertical: 15))),
                child: const Text(
                  "Verify Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Haven't got the email yet?",
                style: TextStyle(
                  color: Color(0xFFD9D6D6),
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
