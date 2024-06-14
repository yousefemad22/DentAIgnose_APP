import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/questiones/questionnairePage.dart';
import 'package:graduation_project/appbar/appbar3.dart';

class PatientDataForm extends StatefulWidget {
  final Map userData;
  PatientDataForm({super.key, required this.userData});

  @override
  _PatientDataFormState createState() => _PatientDataFormState();
}

class _PatientDataFormState extends State<PatientDataForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  late DatabaseReference _databaseReference;
  int? index, dentistIndex;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("persons").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      index = des == null ? 0 :  des.length;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.lightBlue,
        ]),
        image: DecorationImage(
          image: AssetImage(
            "images/لوجو.png",
          ),
          opacity: 0.2,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appbar3(
          title: 'Patient Data',
          backColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Image.asset(
                'images/patient_data.png',
                height: 93,
                width: 93,
              ),
              Text(
                'Patient Data',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      buildShadowTextField(
                        controller: _nameController,
                        labelText: 'Full Name ex: first middle last',
                        icon: Icons.person,
                      ),
                      SizedBox(height: 10),
                      buildGenderDropdown(),
                      SizedBox(height: 10),
                      buildShadowTextField(
                        controller: _numberController,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 10),
                      buildShadowTextField(
                        controller: _dateController,
                        labelText: 'Date of Birth',
                        icon: Icons.calendar_today,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        suffixIcon: Icons.calendar_month_rounded,
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_nameController.text != "" &&
                                _numberController.text != "" &&
                                _dateController.text != "" &&
                                selectedGender != "") {
                              var fullName = _nameController.text.split(" ");
                              if (fullName.length < 3) {
                                showWrongCredentialsDialog(context, "Error",
                                    "Full Name must have first, middle, last name seprated by space");
                              } else {
                                print(fullName[0]);
                                print(fullName[1]);
                                print(fullName[2]);
                                print(selectedDate.year);
                                int age = 2024 - selectedDate.year;
                                Map<String, dynamic> patientData = {
                                  "fName": fullName[0].toLowerCase(),
                                  "mName": fullName[1].toLowerCase(),
                                  "lName": fullName[2].toLowerCase(),
                                  "number":
                                      _numberController.text.toLowerCase(),
                                  "age": age.toString(),
                                  "gender": selectedGender!.toLowerCase(),
                                };

                                DatabaseReference ref = FirebaseDatabase
                                    .instance
                                    .ref("persons/${index.toString()}");
                                ref.set(patientData);

                                _nameController.text = "";
                                _dateController.text = "";
                                _numberController.text = "";
                                selectedGender = "";

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Design(
                                        userData: widget.userData,
                                        patientData: patientData,
                                        patientId: index,
                                      ),
                                    ));
                              }
                            } else {
                              showWrongCredentialsDialog(
                                  context, "Error", "All Fields must be full");
                            }
                          },
                          child: Text('Next',
                              style: TextStyle(color: Colors.blue)),
                          style: ElevatedButton.styleFrom(
                              // primary: Colors.white, // Button color
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: selectedGender,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: 'Gender',
          // labelText: 'Gender',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.people, color: Color(0xFF26a6fe)),
        ),
        items: <String>['Male', 'Female'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue!;
          });
        },
      ),
    );
  }

  Widget buildShadowTextField({
    required String labelText,
    required IconData icon,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap,
    IconData? suffixIcon,
  }) {
    return Container(
      // padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: labelText,
          // labelText: labelText,
          prefixIcon: Icon(icon, color: Color(0xFF26a6fe)),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: Color(0xFF26a6fe)),
                  onPressed: onTap,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
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
