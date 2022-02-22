import 'package:Motivation/styles/colorApp.dart';
import 'package:flutter/material.dart';

class NotificationsComponent extends StatelessWidget {
  const NotificationsComponent({this.Notifications});
  final Notifications;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 18),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(7)),
        // margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, top:3),
              child: Text(
                "Emetteur",
                style: TextStyle(
                  color: ColorsApp.skyBlue,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                    "cvd00000000000000000000000000000000000000scvd0000000000000000")),
            Container(
              child: Text("20h30"),
              alignment: Alignment.bottomRight,
            )
          ],
        ));
  }
}
