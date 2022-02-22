import 'package:Motivation/components/SettingBlocComponent.dart';
import 'package:Motivation/themes/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  child: Text(
                    "Modifier",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.skyBlue),
                  ),
                  padding: EdgeInsets.only(right: 10),
                ),
              ]),
              CachedNetworkImage(
                imageUrl: "" /*   ApiUrl.baseUrl + this.user.img */,
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                      radius: 45, backgroundImage: imageProvider);
                },
                placeholder: (context, url) {
                  return CircleAvatar(
                      /*  backgroundColor: ColorsApp.skyBlue, */
                      radius: 45,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsApp.skyBlue,
                        ),
                      ));
                },
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                      /*  backgroundColor: ColorsApp.skyBlue, */
                      radius: 45,
                      backgroundImage: AssetImage("Img/happy.png"));
                },
              ),
              Container(
                child: Text(
                  "User Name ",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(left: 10),
              ),
              Container(
                child: Text(
                  "690863838",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(left: 10),
              )
            ],
          )),
     Expanded(
           /*    width: MediaQuery.of(context).size.width * .85,
              margin: EdgeInsets.only(top: 10), */
              child: Column(
                children: [ SettingBlocComponent(),
          SettingBlocComponent(),  ],
              )),
    ])));
  }
}
