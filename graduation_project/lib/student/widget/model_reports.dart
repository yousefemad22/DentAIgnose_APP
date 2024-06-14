import 'package:firebase_database/firebase_database.dart';

class ReportsModel {
  // for patient
  var fName, mName, lName, gender, age;
  // for submitter
  var user, userFname, userMname, userLname;

  ReportsModel({
    this.fName,
    this.mName,
    this.lName,
    this.age,
    this.gender,
    this.user,
    this.userFname,
    this.userMname,
    this.userLname,
  });
}


Future<List<ReportsModel?>> reportsPrevData(int reportsIndex) async {
  List<ReportsModel?> reportsDATA = [];

  DatabaseReference reportsReference = FirebaseDatabase.instance.ref("reports");
  DatabaseReference personsReference = FirebaseDatabase.instance.ref("persons");

  List<Future<void>> fetchTasks = [];

  for (int i = 0; i < reportsIndex; i++) {
    // Using `get()` to fetch data once instead of setting a continuous listener
    var fetchTask =
        reportsReference.child(i.toString()).get().then((snapshot) async {
      dynamic des = snapshot.value;
      if (des != null) {
        var user, userFname, userMname, userLname;
        var patFname, patMname, patLname, patGender, patAge;

        // Get receptionist data if exists
        if (des['receptionistId'] != null) {
          DataSnapshot recData = await personsReference
              .child(des['receptionistId'].toString())
              .get();
          userFname = recData.child('fName').value;
          userMname = recData.child('mName').value;
          userLname = recData.child('lName').value;
          user = "Rec:";
        }

        // Get intern data if exists
        if (des['internId'] != null) {
          DataSnapshot intData =
              await personsReference.child(des['internId'].toString()).get();
          userFname = intData.child('fName').value;
          userMname = intData.child('mName').value;
          userLname = intData.child('lName').value;
          user = "Int:";
        }

        // Get patient data if exists
        if (des['patientId'] != null) {
          DataSnapshot patData =
              await personsReference.child(des['patientId'].toString()).get();
          patFname = patData.child('fName').value;
          patMname = patData.child('mName').value;
          patLname = patData.child('lName').value;
          patAge = patData.child('age').value;
          patGender = patData.child('gender').value;
        }

        // Add to reports list
        reportsDATA.add(ReportsModel(
          fName: patFname,
          mName: patMname,
          lName: patLname,
          age: patAge,
          gender: patGender,
          user: user,
          userFname: userFname,
          userMname: userMname,
          userLname: userLname,
        ));
      }
    });
    fetchTasks.add(fetchTask);
  }

  // Wait for all fetch tasks to complete
  await Future.wait(fetchTasks);
  return reportsDATA;
}
