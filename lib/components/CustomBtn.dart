import 'package:Motivation/styles/colorApp.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({this.title, this.value, this.onTap});
  var onTap;
  var value;
  var title;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.arrow_forward,
                )
              ],
            ),
            Text(
              "$value",
              style: TextStyle(
                  color: ColorsApp.skyBlue, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ));
  }
}
