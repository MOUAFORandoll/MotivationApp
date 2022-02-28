import 'package:flutter/material.dart';

class ColorSelect extends StatelessWidget {
  const ColorSelect({this.currentColor});
  final int ? currentColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(color: Color(currentColor!))),
        onTap: () {
          print("${currentColor}");
        });
  }
}
