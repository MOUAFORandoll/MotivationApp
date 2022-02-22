/* import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeNotification extends StatefulWidget {
  BadgeNotification({this.title, this.child, this.notif, this.onTap});

  final child, title, notif, onTap;

  @override
  _BadgeNotificationState createState() => _BadgeNotificationState();
}

class _BadgeNotificationState extends State<BadgeNotification> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.2, color: Colors.grey)),
            height: 80,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ((widget.notif == null) ? false : widget.notif)
                      ? Badge(
                          position: BadgePosition.topStart(top: -9, start: -8),
                          badgeContent:
                              Text('.', style: TextStyle(color: Colors.red)),
                          child: widget.child)
                      : SizedBox(
                          child: widget.child,
                        ),
                  SizedBox(height: 5),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            )));
  }
}

class Notifications extends StatefulWidget {
  Notifications({this.child, this.notif, this.onTap});

  final child, notif, onTap;

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
            height: 80,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ((widget.notif == null) ? false : widget.notif)
                      ? Badge(
                          elevation: 1,
                          position: BadgePosition.topStart(top: -8, start: -3),
                          badgeContent:
                              Text('.', style: TextStyle(color: Colors.red)),
                          child: widget.child)
                      : SizedBox(
                          child: widget.child,
                        ),
                ],
              ),
            )));
  }
}
 */