import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoComponent extends StatelessWidget {
  InfoComponent({this.title, this.value, this.divider, this.onTap});

  var title, value, onTap;
  var divider;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 3),
          margin: EdgeInsets.only(bottom: 3),
          decoration: ((divider == null) ? true : divider)
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12),
                  ),
                )
              : BoxDecoration(),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
              Text(value.toString(),
             )
            ],
          )),
      onTap: onTap,
    );
  }
}
