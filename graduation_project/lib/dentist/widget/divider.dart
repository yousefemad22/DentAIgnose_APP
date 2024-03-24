import 'package:flutter/material.dart';

class divider extends StatelessWidget {
  const divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xff24a7f9), // Set the color of the divider
      thickness: 2, // Set the thickness of the divider
      indent: 15, // Set the indent (left padding) of the divider
      endIndent: 280, // Set the end indent (right padding) of the divider
    );
  }
}
class verticalDivider extends StatelessWidget {
  const verticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Color(0xff24a7f9),
      thickness: 2,
      indent: 25,
      endIndent: 25,
      width: 20,
    );
  }
}
