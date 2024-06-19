import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/notification/model_notification.dart';

class notification extends StatelessWidget {
  final MessageViewModel viewModel = MessageViewModel();

  notification({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
            size: screenWidth * 0.06,
          ),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth*0.03),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = viewModel.data.keys.elementAt(index);
                  List<Message> messages = viewModel.data[key]!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Text(
                          key,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: screenWidth * 0.04,
                            // fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          Message message = messages[index];
                          return cardnotifi(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            date: message.dateSend,
                            time: message.time,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardnotifi({
    required double screenWidth,
    required double screenHeight,
    required String time,
    required String date,
  }) {
    return Container(
      height: screenHeight*0.05,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.0015),
      // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, screenHeight * 0.005),
            blurRadius: screenWidth * 0.02,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.notifications_active, size: screenWidth * 0.08, color: Color(0xff26a6fe)),
          SizedBox(width: screenWidth * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Patient',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'You can see the report....',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  // fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  // fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  // fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
