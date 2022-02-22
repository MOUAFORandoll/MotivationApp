import 'package:Motivation/components/userComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:flutter/material.dart';

newMessage(context) {
  showModalBottomSheet(
      barrierColor: Colors.grey,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => SafeArea(
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter mystate) =>
                    Container(
                      height: MediaQuery.of(context).size.height / 1.04,
                      child: SafeArea(
                          child: Column(children: [
                        Container(
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nouv. discussion ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                      child: Text(
                                        "Annuler",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsApp.skyBlue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ])),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: (ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: UserComponent()),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      height: 2,
                                    );
                                  },
                                  itemCount: 100))),
                        )
                      ])),
                    )),
          ));
}
