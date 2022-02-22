import 'package:flutter/material.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({this.message});
  final message;
  @override
  Widget build(BuildContext context) {
    return /*  Stack(children: [ */
        Container(
      margin: EdgeInsets.only(top: 18),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      // margin: EdgeInsets.only(left: 10),
      child: Text(
          "cvd00000000000000000000000000000000000000scvd00000000000000000000000000000000000000scvd00000000000000000000000000000000000000s"),
    )
        /* ,Positioned(
        right: 11,
        top: 11,
        child: new Container(
          padding: EdgeInsets.all(2),
          decoration: new BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            minWidth: 14,
            minHeight: 14,
          ),
          child: Text(
            'fdsfg0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ]) */
        ;
  }
}
