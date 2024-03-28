
import 'package:flutter/material.dart';
import 'package:graduation_project/questiones/question.dart';
class DateQuestionScreen extends StatefulWidget {
  @override
  _DateQuestionScreenState createState() => _DateQuestionScreenState();
}

class _DateQuestionScreenState extends State<DateQuestionScreen> {
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF26A6FE),
                        Color(0xFF1BADE1),
                        Color(0xFF9DE8FC),
                      ],
                    ),
                  ),
                ),
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
                radius: 65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/logo2.png'),
                    Text(
                      'DentAIgnose',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26A6FE)),
                    )
                  ],
                )),
          ),
          Positioned(
            top: size.height * 0.1,
            right: -100,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, .6),
                      Color(0xFF9DE8FC),
                    ],
                  ),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: size.height * -.1,
            right: 130,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, .6),
                      Color(0xFF9DE8FC),
                    ],
                  ),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: size.height * .1,
            right: 100,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Since when have you been in pain?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0XFF26A6FE),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.48,
            left: 20,
            right: 20,
            child: Container(
              height: 55,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 20,
                    offset: const Offset(-1, 15),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  suffixIcon:Image.asset('images/clender.png',width: 27,height: 50,) ,
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CategoryQuestionScreen()),
                );
              },
              child: Text('Next',
                  style: TextStyle(
                      color: Color(0xFF26A6FE),
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
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