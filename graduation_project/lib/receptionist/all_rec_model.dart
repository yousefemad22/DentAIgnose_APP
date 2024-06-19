import 'package:firebase_database/firebase_database.dart';

class RecModel {
  var recIndex, fName, mName, lName, gender, age, number, accIndex, email, pass;

  RecModel({
    this.recIndex,
    this.fName,
    this.mName,
    this.lName,
    this.age,
    this.number,
    this.gender,
    this.accIndex,
    this.email,
    this.pass,
  });
}

Future<List<RecModel?>> recPrevData(int recsIndex, var who) async {
  List<RecModel?> recsDATA = [];

  DatabaseReference recsReference =
      FirebaseDatabase.instance.ref(who);
  DatabaseReference accReference = FirebaseDatabase.instance.ref("accounts");
  DatabaseReference personsReference = FirebaseDatabase.instance.ref("persons");

  List<Future<void>> fetchTasks = [];

  for (int i = 0; i < recsIndex; i++) {
    // Using `get()` to fetch data once instead of setting a continuous listener
    var fetchTask =
        recsReference.child(i.toString()).get().then((snapshot) async {
      dynamic des = snapshot.value;
      if (des != null) {
        var fName, lName, mName, age, gender;

        // Get person data if exists
        if (des['personId'] != null && des['accountId'] != null) {
          DataSnapshot recData =
              await personsReference.child(des['personId'].toString()).get();
          DataSnapshot accData =
              await accReference.child(des['personId'].toString()).get();

          recsDATA.add(RecModel(
            recIndex: des['personId'],
            fName: recData.child('fName').value,
            mName: recData.child('mName').value,
            lName: recData.child('lName').value,
            age: recData.child('age').value.toString(),
            number: recData.child('number').value.toString(),
            gender: recData.child('gender').value,

            accIndex: des['accountId'],
            email: accData.child('email').value,
            pass: accData.child('password').value,
          ));
        }
      }
    });
    fetchTasks.add(fetchTask);
  }

  // Wait for all fetch tasks to complete
  await Future.wait(fetchTasks);
  return recsDATA;
}
