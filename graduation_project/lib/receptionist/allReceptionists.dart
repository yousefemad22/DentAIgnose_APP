import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/Edit_profile/edit_profile.dart';
import 'package:graduation_project/appbar/appbar3.dart';
import 'package:graduation_project/get_start/create_account.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:graduation_project/receptionist/all_rec_model.dart';

class All_reciptionist extends StatefulWidget {
  var who;
  All_reciptionist({super.key, required this.who});
  @override
  State<All_reciptionist> createState() => _All_reciptionistState();
}

class _All_reciptionistState extends State<All_reciptionist> {
  late DatabaseReference _databaseReference;
  int? recsIndex = 3;
  List? data;

  @override
  void initState() {
    super.initState();
    // index for saving choices
    _initializeRecData();
  }

  Future<void> _initializeRecData() async {
    await getAllRecData();
    print("after Report Data is loaded");
    setState(() {}); // Update the state after data is loaded
  }

  Future<void> getAllRecData() async {
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("${widget.who}").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      recsIndex = des != null ? des.length : 0;
      // print(des.length);
      print(recsIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: appbar3(
            title: "All ${widget.who}",
            backColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(children: [
                FutureBuilder<List<RecModel?>>(
                  future: recPrevData(
                      recsIndex!, widget.who), // Call your method here
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error damnnnnn: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      var data = snapshot.data!;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var rec = data[index];
                          Map userData = {
                            'recIndex': rec!.recIndex,
                            'fName': rec.fName,
                            'mName': rec.mName,
                            'lName': rec.lName,
                            'age': rec.age,
                            'number': rec.number,
                            'gender': rec.gender,
                            'accIndex': rec.accIndex,
                            'email': rec.email,
                            'pass': rec.pass,
                          };
                          return receptionistCard(
                            metaData: userData,
                          );
                        },
                      );
                    } else {
                      return Text("No data available");
                    }
                  },
                ),
              ]),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Create_account(user: "${widget.who}"),
                  ));
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              foregroundColor: Colors.white,
              child: Icon(Icons.person_add_alt_1),
            ),
          ),
        ));
  }
}

class receptionistCard extends StatelessWidget {
  var metaData;
  receptionistCard({super.key, this.metaData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
          width: 375,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 4),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        metaData['fName'] +
                            " " +
                            metaData['mName'] +
                            " " +
                            metaData['lName'],
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          child: Text(
                            "${metaData['age']} years old",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, top: 10, bottom: 10),
                          child: Text(
                            metaData['gender'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ]),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Edit_Profile(userData: metaData);
                      }));
                    },
                  )),
            ],
          )),
    );
  }
}
