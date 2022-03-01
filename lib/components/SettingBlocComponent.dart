import 'package:Motivation/styles/colorApp.dart';
import 'package:flutter/material.dart';

class SettingBlocComponent extends StatelessWidget {
  SettingBlocComponent({required this.listChild});
  final List listChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .85,
      margin: EdgeInsets.only(top: 10),
      decoration: new BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: (ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return BlocBtnComponent(
                icon: listChild[index]['icon'],
                title: listChild[index]['title'],
                onTap: listChild[index]['action']);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 2,
            );
          },
          itemCount: listChild.length)),
    );
  }
}

class BlocBtnComponent extends StatelessWidget {
  const BlocBtnComponent({this.icon, this.title, this.onTap});
  final icon, title, onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              IconButton(
                  icon: Icon(icon, size: 25, color: ColorsApp.skyBlue),
                  onPressed: () {
                    /*   Navigator.of(context).pop(); */
                  }),
              Text(title)
            ]),
            Container(
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
              padding: EdgeInsets.only(right: 10),
            )
          ]),
        ),
        onTap: onTap);
  }
}
