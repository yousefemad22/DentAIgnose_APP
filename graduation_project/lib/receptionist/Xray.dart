import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/appbar/appbar3.dart';
import 'package:graduation_project/reports/Reportpage.dart';
import 'package:graduation_project/roboflow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:graduation_project/receptionist/cutXrays.dart';
import 'package:graduation_project/receptionist/bounaryboxImage.dart';

class Xray extends StatefulWidget {
  Map? reportMap, choicesMap, patientData;
  dynamic firebaseRefrence, reportId, patientId;
  Xray(
      {super.key,
      this.reportMap,
      this.patientId,
      this.reportId,
      this.choicesMap,
      this.firebaseRefrence,
      this.patientData});

  @override
  State<Xray> createState() => _XrayState();
}

class _XrayState extends State<Xray> {
  File? image;
  String? imageUrl;

  var finalImageData;

  final ImagePredictionService predictionService = ImagePredictionService();
  String? newImagePath;
  var pred;

  getCameraImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? imageCamera =
        await picker.pickImage(source: ImageSource.camera);

    if (imageCamera != null) {
      image = File(imageCamera!.path);
    }
    setState(() {
      finalImageData = [imageCamera!, image];
    });
  }

  getGalleryImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? imageGallery = await picker.pickImage(
        source: ImageSource.gallery, maxWidth: 200, maxHeight: 200);

    if (imageGallery != null) {
      image = File(imageGallery!.path);
      setState(() {
        finalImageData = [imageGallery!, image];
      });
    }

    // await image!.copy('graduation_project/images/xrays/new.jpg');

    // Save the picked image to a file
    await saveImageToFile(image!);

    print(imageGallery);
  }

  Future<void> saveImageToFile(File imageFile) async {
    final Directory directory = await getApplicationDocumentsDirectory();

    // Ensure the directory exists; create it if it doesn't
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    // Create a file with a different name (output.jpg)
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final File newImageFile = File('${directory.path}/$timestamp.jpg');

    // Copy the picked image file to the new file location
    await imageFile.copy(newImageFile.path);

    newImagePath = newImageFile.path;
  }

  late DatabaseReference _databaseReference, _databaseReference2;
  var xrayIndex;

  @override
  void initState() {
    super.initState();
    // index for saving choices
    _databaseReference = FirebaseDatabase.instance
        .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
    print("connected");
    _databaseReference.child("x-rays").onValue.listen((event) {
      dynamic des = event.snapshot.value;
      xrayIndex = des.length;
      // print(choiceIndex);
    });
    
    if (widget.reportId == null) {
      // index for saving reports
      _databaseReference2 = FirebaseDatabase.instance
          .refFromURL("https://dentaignose-a0427-default-rtdb.firebaseio.com/");
      print("connected");
      _databaseReference2.child("reports").onValue.listen((event) {
        dynamic des = event.snapshot.value;
        widget.reportId = des == null ? 0 : des.length;
        print("reportIndex: ${widget.reportId}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appbar3(
              title: 'Upload X-ray',
              backColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const CircleAvatar(
                //         backgroundColor: Colors.white,
                //         child: BackButtonIcon(),
                //       ),
                //       const SizedBox(
                //         width: 200,
                //       ),
                //       Expanded(
                //         child: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Image.asset(
                //               'images/لوجو.png',
                //               width: 100,
                //               height: 100,
                //             ),
                //             Text(
                //               "DentAIgnose",
                //               style: TextStyle(
                //                 color: Color(0xFFD9D6D6),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // const Text(
                //   "Upload your X-ray",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 40,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (image == null)
                      GestureDetector(
                        onTap: () {
                          getGalleryImage();
                        },
                        child: Column(
                          children: [
                            Icon(
                                size: screenSize.width * 0.15,
                                Icons.file_upload_outlined,
                                color: Colors.white),
                            SizedBox(
                              height: screenSize.width * 0.05,
                            ),
                            Text(
                              " Choose image ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (image == null)
                      GestureDetector(
                        onTap: () {
                          getCameraImage();
                        },
                        child: Column(
                          children: [
                            Icon(
                                size: screenSize.width * 0.15,
                                Icons.camera,
                                color: Colors.white),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            Text(
                              " Capture image ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (pred != null)
                      Container(
                        width: screenSize.width * 0.15,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            pred != null ? pred.toString() : "DAMN",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    // if (pred != null)
                    //   Text(
                    //     cutTheShit(newImagePath, pred).toString(),
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    if (image != null && pred == null)
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue,
                              Color.fromARGB(255, 81, 88, 81)
                            ], // Adjust colors as needed
                          ),
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust radius as needed
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: SizedBox(
                            width: 200, // Set the maximum width here
                            child: Image.file(
                              image!, // Assuming image is not null
                              fit: BoxFit
                                  .cover, // Adjust how the image fits within the box
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      // Save Image in fire storage and gets its URL
                      var imageName = basename(finalImageData[0]!.path);
                      var refStorage =
                          FirebaseStorage.instance.ref("X-rays/$imageName");
                      await refStorage.putFile(image!);
                      imageUrl = await refStorage.getDownloadURL();

                      // Image prediction
                      var jj =
                          await predictionService.predictImage(newImagePath!);
                      setState(() {
                        pred = jj;
                      });
                      print(jj);
                      await uploadXrayData(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  report(reportId: widget.reportId)));

                      // Testing some shits

                      // // Cut image
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context)=> ImageFromUrl(imageURL: imageUrl!, prediction: pred)));

                      // boundary box image
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ImageProcessor(
                      //             imageURL: imageUrl!, prediction: pred)));

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ImageAnalysisPage(
                      //             imageURL: imageUrl!, prediction: pred)));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05,
                          vertical: screenSize.height * 0.01),
                      child: Text(
                        'Upload file',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenSize.width * 0.04,
                        ),
                      ),
                    )),
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
              ]),
            )),
      ),
    );
  }

  Future<void> uploadXrayData(BuildContext context) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("x-rays/${xrayIndex.toString()}");

    ref.set({
      'imagePath': imageUrl,
      'pred': pred,
    });

    if (widget.reportMap != null) {
      widget.reportMap!['x-rayId'] = xrayIndex;
      print(widget.reportMap!);
      widget.firebaseRefrence.set(widget.reportMap);
    } else {
      widget.firebaseRefrence = FirebaseDatabase.instance
          .ref("reports/${widget.reportId.toString()}");
      widget.reportMap = {'x-rayId': xrayIndex};
      widget.firebaseRefrence.set(widget.reportMap);
    }

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => report(
    //               reportId: widget.reportId,
    //             )));
  }
}
