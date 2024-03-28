import 'package:flutter/material.dart';

class Design extends StatefulWidget {
  const Design({super.key});

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
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
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
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
