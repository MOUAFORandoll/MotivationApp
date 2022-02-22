import 'package:flutter/material.dart';

class DrawerChild extends StatelessWidget {
  DrawerChild({this.image, this.title, this.onTap});
  var image;
  var title;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .1,
        child: GestureDetector(
          child: Container(
              margin: EdgeInsets.only(right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      child: Image.asset(image, height: 18, width: 18),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1,
                        ),
                        child: Text(
                          title,
                          /* style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)) */
                        ))
                  ]),
                  Icon(
                      //  FontAwesomeIcons.angleRight,
                      Icons.keyboard_arrow_right_outlined)
                ],
              )),
          onTap: onTap,
        ));
  }
}
