import 'package:flutter/material.dart';
import 'package:graduation_project/student/widget/item_learn.dart';
import 'package:graduation_project/student/widget/learn.dart';

class learnsection extends StatefulWidget {
  learnsection({super.key});

  @override
  State<learnsection> createState() => _learnsectionState();
}

class _learnsectionState extends State<learnsection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Learn()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 99,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 20,
              offset: const Offset(-1, 15),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            item(
                img: 'images/artecils.png',
                text: 'Articles',
                print: 'Articles'),
            item(img: 'images/video.png', text: 'Videos', print: 'Videos'),
            item(
                img: 'images/microphone.png',
                text: 'Podcast',
                print: 'Podcast'),
          ],
        ),
      ),
    );
  }
}
