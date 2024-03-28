import 'package:flutter/material.dart';

class CategoryQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(color: Colors.lightBlueAccent),
              ),
              Expanded(
                flex: 3,
                child: Container(color: Colors.white),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.05,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child:
              Icon(Icons.ac_unit, color: Colors.lightBlueAccent, size: 50),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: -60,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Could you specify the exact area that is affected?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.4,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  OptionButton(title: ' Upper left', onPressed: () {}),
                  SizedBox(height: 8.0),
                  OptionButton(title: ' Upper right', onPressed: () {}),
                  SizedBox(height: 8.0),
                  OptionButton(title: ' Lower left', onPressed: () {}),
                  SizedBox(height: 8.0),
                  OptionButton(title: ' Lower right', onPressed: () {}),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  minimumSize: Size(87, 34)),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const OptionButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title, style: TextStyle(fontSize: 18.0)),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.blue, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        minimumSize: Size(double.infinity, 56),
      ),
    );
  }
}
