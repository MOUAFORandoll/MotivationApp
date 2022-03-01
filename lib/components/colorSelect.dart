/* import 'package:flutter/material.dart';

class ColorSelect extends StatefulWidget {
  ColorSelect({this.currentColor, this.value});
  final int? currentColor;
  var value;

  @override
  _ColorSelectState createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin: EdgeInsets.all(5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(color: Color(widget.currentColor!))),
        onTap: () {
          setState(() {
            widget.value = widget.currentColor;
          });
          print("${widget.currentColor}");
        });
  }
}
 */