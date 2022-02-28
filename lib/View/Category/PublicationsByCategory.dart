import 'package:Motivation/components/conversationsComponent.dart';
import 'package:Motivation/components/messageComponent.dart';
import 'package:Motivation/components/motivationComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:Motivation/viewmodels/users_list_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicationsByCategory extends StatefulWidget {
  PublicationsByCategory({this.category});
  final category;

  @override
  _PublicationsByCategoryState createState() => _PublicationsByCategoryState();
}

class _PublicationsByCategoryState extends State<PublicationsByCategory> {
  @override
  void initState() {
    Provider.of<UserListViewModel>(context, listen: false).getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        padding: EdgeInsets.only(top: 18, bottom: 18),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.arrow_back_ios_new)),
              onTap: () {
                Navigator.pop(context);
              }),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Publications de la categorie ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 20), child: Icon(Icons.add)),
        ]),
      ),
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 8),
            child: (ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: MotivationComponent(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 2,
                  );
                },
                itemCount: 50))),
      ),
    ])));
  }
}
