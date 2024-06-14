import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/questiones/questionnaireComponents.dart';
import 'package:graduation_project/receptionist/Xray.dart';
import 'package:graduation_project/reports/Reportpage.dart';

class Design extends StatefulWidget {
  final Map userData;
  dynamic patientData, patientId;
  Design({super.key, required this.userData, this.patientData, this.patientId});

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  int questionIndex = 0;
  int? selectedAnswerIndex;

  late DatabaseReference _databaseReference, _databaseReference2;
  var choiceIndex, reportIndex;

  @override
  void initState() {
    super.initState();
    // index for saving choices
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("choices").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      choiceIndex = des == null ? 0 : des.length;
      print("choiceIndex: $choiceIndex");
    });

    // index for saving reports
    _databaseReference2 = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference2.child("reports").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      reportIndex = des == null ? 0 : des.length;
      print("reportIndex: $reportIndex");
    });
    if (widget.patientId != null) {
      widget.patientId--;
      print("patientId: ${widget.patientId}");
    }
  }

  Future<bool?> showConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF26A6FE),
          title: const Text(
            "Confirm",
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Do U want to continue and add x-ray or display Report only for that?",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false
              },
              child: const Text(
                "Don't continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop(true); // Return true
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                  color: Color(0xFF26A6FE),
                ),
              ),
            ),
          ],
        );
      },
    );
    // return "tesd";
  }

  Future saveTofirebase(
      List choicesLabels, List choicesDescription, String diagnoses) async {
    Map<String, String> choicesMap = {
      for (int i = 0; i < choicesLabels.length; i++) "$i": choicesLabels[i],
      "diagnoses": diagnoses,
      "description": choicesDescription.toString(),
    };

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("choices/${choiceIndex.toString()}");
    ref.set(choicesMap).then((_) {
      print("Data saved successfully.");
    }).catchError((error) {
      print("Failed to save data: $error");
    });
    // Navigate to where ????????????????????????????????????????????????????????????????????????????
    ref = FirebaseDatabase.instance.ref("reports/${reportIndex.toString()}");
    if (widget.patientId == null) {
      // if student fill questionnaire
      Map<String, dynamic> reportMap = {};
      if (widget.userData['email'].toString().endsWith == "@intern.com") {
        reportMap = {
          "choiceId": choiceIndex,
          "x-rayId": null,
          "patientId": null,
          "internId": widget.userData['id'],
          "receptionistId": null,
        };
      } else {
        reportMap = {
          "choiceId": choiceIndex,
          "x-rayId": null,
          "patientId": null,
          "internId": null,
          "receptionistId": widget.userData['id'],
        };
      }
      ref.set(reportMap);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => report(reportId: reportIndex)));
    } else {
      // when receptionisn fill questionnaire
      print(widget.patientId);
      Map<String, dynamic> reportMap = {
        "choiceId": choiceIndex,
        "x-rayId": null,
        "patientId": widget.patientId,
        "internId": null,
        "receptionistId": widget.userData['id'],
      };
      // pop up window to handle filling x-ray or not -------------------------------
      // pop up .............................................................
      bool? confirmed = await showConfirmationDialog(context);
      if (confirmed!) {
        // when adding x-ray
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Xray(
                    reportMap: reportMap,
                    choicesMap: choicesMap,
                    firebaseRefrence: ref,
                    patientData: widget.patientData)));
      } else {
        // when not adding x-ray
        ref.set(reportMap);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => report(reportId: reportIndex)));
      }
      // ..................................................................
    }
  }

  void _nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
    } else {}
  }

////////////////////////////////////hala////////////////////////////////////
  var yMap = new Map();

  void YQues(var questionindex) {
    if (selectedAnswerIndex == null) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('ولا ولا اختار  اجااااابة هنهزر ولا ايه ')),
      // );
      return showWrongCredentialsDialog(
          context, "Warning", "You Must Select answer.");
    } else {
      var yList = ['Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'Q6', 'Q7', 'Q8'];

      yMap[yList[questionindex]] =
          questions[questionindex]['answers'][selectedAnswerIndex];

      if (questionIndex == questions.length - 1) {
        // print('\n');
        // print(yMap);

        var choicesLabel, choicesDescription, diagnoses;
        diagnoses = diagnose();
        [choicesLabel, choicesDescription] = temp();

        print("Choices Labels : $choicesLabel");
        print("Choices Description : $choicesDescription");
        print("Diagnoses : $diagnoses");
        saveTofirebase(choicesLabel, choicesDescription, diagnoses);
      }
      _nextQuestion();
    }
  }

  String diagnose() {
    if (questionIndex == questions.length - 1) {
      if (yMap['Q1'] == 'Suddenly' &&
          yMap['Q2'] == 'Throbbing / Pulsating' &&
          yMap['Q4'] == 'Minutes' &&
          yMap['Q5'] == 'Headache' &&
          yMap['Q8'] == 'Progressive') {
        // print("\n diagnose is : needs root canal treatment (RCT).");
        return "needs root canal treatment (RCT).";
      } else if (yMap['Q2'] == 'Electric / Sharp Shooting') {
        // print("\n diagnose is : needs refill (new restoration).");
        return "needs refill (new restoration).";
      } else if ((yMap['Q3'] == 'Cold drinks' || yMap['Q3'] == 'Sweets') &&
          yMap['Q4'] == 'Seconds' &&
          yMap['Q8'] == 'Intermittent') {
        // print("\n diagnose is : need operative(restoration).");
        return "need operative(restoration).";
      }
    }
    return "";
  }

  List temp() {
    var choicesBas = [];
    for (var x = 1; x <= yMap.length; x++) {
      // print(yMap['Q${x}']);
      choicesBas.add(yMap['Q$x']);
    }

    var choicesDisc = [];
    for (var x = 0; x < choicesBas.length; x++) {
      // print(yMap['Q${x}']);
      choicesDisc.add(choicesMap[choicesBas[x]]);
    }
    // print('\n');
    // print("Choices label: $choicesBas");
    // print("Choices Description: $choicesDisc");
    return [choicesBas, choicesDisc];
  }
////////////////////////////////////hala////////////////////////////////////

  Widget _buildAnswerOption(int index, String answer) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAnswerIndex = index;
          print("selected index is $selectedAnswerIndex");
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: selectedAnswerIndex == index
              ? Color.fromARGB(255, 182, 207, 225)
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: selectedAnswerIndex == index
                ? Color.fromARGB(255, 44, 170, 255)
                : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Text(
          '${String.fromCharCode(65 + index)}. $answer',
          style: TextStyle(
            color: selectedAnswerIndex == index ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
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
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(18),
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
            top: size.height * 0.15,
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
            right: 150,
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
            top: size.height * 0.05,
            right: 20,
            child: GestureDetector(
              onTap: () async {
                var rr = await showConfirmationDialog(context);
                print("rr: $rr");
              },
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
          ),
          Positioned(
            top: size.height * 0.05,
            left: 15,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,
                        color: Color(0xFF26A6FE)))),
          ),
          Positioned(
            top: size.height * 0.30,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 84, 186, 255).withOpacity(1),
                    blurRadius: 20,
                    offset: const Offset(-1, 1),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                questions[questionIndex]['question'],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF26A6FE)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.45,
            left: 20,
            right: 20,
            child: SingleChildScrollView(
              child: Column(
                children: questions[questionIndex]['answers']
                    .asMap()
                    .entries
                    .map<Widget>(
                        (entry) => _buildAnswerOption(entry.key, entry.value))
                    .toList(),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () => YQues(questionIndex),
              child: Text('Next',
                  style: TextStyle(
                      color: Color(0xFF26A6FE),
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minimumSize: Size(87, 34),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          if (questionIndex > 0)
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionIndex--;
                    selectedAnswerIndex = null;
                  });
                },
                child: Text('Back',
                    style: TextStyle(
                        color: Color(0xFF26A6FE),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(87, 34),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void showWrongCredentialsDialog(
    BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            title == "Error" ? Color(0xFFFC5A4F) : Color(0xff0a6ff9),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xff1c9cf3))),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
