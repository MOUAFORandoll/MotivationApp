import 'dart:convert';
import 'dart:io';

import 'package:Motivation/components/button.dart';
import 'package:Motivation/components/infoComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:Motivation/utils/api/apiUrl.dart';
import 'package:Motivation/utils/functions/route.dart';
import 'package:Motivation/utils/provider/refresh_token.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';
import "package:provider/provider.dart";

// ignore: must_be_immutable
class ProfileUserScreen extends StatefulWidget {
  var accessToken;
  ProfileUserScreen({this.accessToken});
  @override
  _ProfileUserScreenState createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool ok = false;
  /*  _getMembre() async {
    setState(() {
      ok = false;
    });
    var payload = Jwt.parseJwt(widget.accessToken.toString());
    String userid = payload["id"].toString();
    //print('..................................$userid');
    var dio = await CustomDio().getApiClient();
    final response = await dio.get(ApiUrl.baseUrl + '/api/membres/$userid');

    if (response.data.length > 0) {
      setState(() {
        ok = true;
        membre = member.fromJson(response.data);
      });
      print(membre.adress);
    } else {
      setState(() {});
      throw Exception("Faill to load member infos");
    }
    //print('.......................................................');
  } */
/* 
  _getMembre2() async {
    var payload = Jwt.parseJwt(widget.accessToken.toString());
    String userid = payload["id"].toString();
    //print('..................................$userid');
    var dio = await CustomDio().getApiClient();
    final response = await dio.get(ApiUrl.baseUrl + '/api/membres/$userid');

    if (response.data.length > 0) {
      setState(() {
        membre = member.fromJson(response.data);
      });
      print("get member  2........................{membre.Nom}");
    } else {
      setState(() {});
      throw Exception("Faill to load member infos");
    }
    //print('.......................................................');
  }
 */
  GetStorage box = GetStorage();
  @override
  void dispose() {
    super.dispose();
  }

  bool imgBool = true;
  File images = File("");
/* 
  member membre = member(numCni: "0", cniRep: "");
  */
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _newpasswordController = TextEditingController();
  bool udateAdd = false;
  bool udatePass = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Information de l'utilisateur",
            style: TextStyle(
              fontFamily: "orkney",
              /*   color: (themeProvider.themeMode == ThemeMode.dark)
                  ? Colors.white
                  : Colors.black, */
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          /* leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              /*  color: (themeProvider.themeMode == ThemeMode.dark)
                  ? Colors.white
                  : Colors.black, */
            ),
          ), */
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: /*  ok
              ?  */
                Column(children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text("Profile image"),
              margin: EdgeInsets.only(left: 20, bottom: 7)),
          Column(children: <Widget>[
            Container(
                child: Column(
              children: [
                Stack(children: [
                  CachedNetworkImage(
                    imageUrl: "",
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 200,
                        /*  width: double.infinity, */

                        decoration: BoxDecoration(
                          /*  color: ColorsApp.pink, */
                          /*   borderRadius: BorderRadius.circular(10), */
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                        child: Align(
                          alignment: Alignment(0.8, 0.8),
                          child: (imgBool)
                              ? Container(
                                  decoration: BoxDecoration(
                                    /*  border: Border.all(
                                              color: Colors.white,
                                              style
                                            ), */
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.black45,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: ColorsApp.skyBlue,
                                      child: IconButton(
                                        onPressed: () async {
                                          File image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery,
                                                  maxHeight: double.infinity,
                                                  maxWidth: double.infinity,
                                                  imageQuality: 100);
                                          setState(() {
                                            if (!images.path
                                                .contains(image.path)) {
                                              images = image;
                                              print(images.path);
                                            }
                                          });
                                          if (image.path.isEmpty) {
                                            print("required image");
                                          }
                                          setState(() {
                                            imgBool = false;
                                          });
                                        },
                                        icon: Icon(FontAwesomeIcons.pen,
                                            color: Colors.white, size: 25),
                                      )))
                              : Container(
                                  padding: EdgeInsets.only(
                                      top: 7, left: 10, right: 10, bottom: 7),
                                  child: SpinKitCircle(
                                    color: Colors.blue,
                                    size: 40,
                                  )),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorsApp.skyBlue,
                            ),
                          ));
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                        padding: EdgeInsets.only(
                          right: 30,
                        ),
                        /* decoration: BoxDecoration(
                                      color: ColorsApp.pink,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: ,
                                          fit: BoxFit.cover),
                                    ), */
                        child: Align(
                          alignment: Alignment(1.0, 0.8),
                          child: (imgBool)
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: ColorsApp.skyBlue,
                                  child: IconButton(
                                    onPressed: () async {
                                      File image = await ImagePicker.pickImage(
                                          source: ImageSource.gallery,
                                          maxHeight: double.infinity,
                                          maxWidth: double.infinity,
                                          imageQuality: 100);
                                      setState(() {
                                        if (!images.path.contains(image.path)) {
                                          images = image;
                                          print(images.path);
                                        }
                                      });
                                      if (image.path.isEmpty) {
                                        print("required image");
                                      }
                                      setState(() {
                                        imgBool = false;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.pen,
                                      color: Colors.white,
                                    ),
                                  ))
                              : Container(
                                  padding: EdgeInsets.only(
                                      top: 7, left: 10, right: 10, bottom: 7),
                                  child: SpinKitCircle(
                                    color: Colors.blue,
                                    size: 40,
                                  )),
                        ),
                      );
                    },
                  ),
                ]),
              ],
            )),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(children: <Widget>[
                  InfoComponent(title: Text("First name"), value: "Nom"),
                  InfoComponent(title: Text("Last name"), value: "Prenom"),
                  InfoComponent(title: Text("Phone number"), value: "Aucun"),
                  InfoComponent(
                      title: Row(children: [
                        Text("Adress"),
                        Container(
                            child: Icon(FontAwesomeIcons.pen,
                                size: 12, color: Color(0xFFCFD6D6)),
                            margin: EdgeInsets.only(left: 10))
                      ]),
                      value: "addresse",
                      onTap: () {
                        print("eeeeeeeeee");
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) => StatefulBuilder(
                                  builder: (BuildContext context,
                                          StateSetter setState) =>
                                      Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)), //this right here
                                    child: Container(
                                      height: 180,
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0, top: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Votre adresse',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 8),
                                          ),
                                          SizedBox(
                                              child: TextFormField(
                                            onChanged: (value) {},
                                            controller: _addressController,
                                            validator: (value) {
                                              if (value == "") {
                                                return "veillez remplir se champs";
                                              } else {
                                                return null;
                                              }
                                            },
                                            keyboardType: TextInputType.text,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: "ville",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )),
                                          Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                    child: const Text(
                                                      'CANCEl',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    onPressed: () {
                                                      _addressController
                                                          .clear();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  Button(
                                                      title: 'Update',
                                                      enabled: true,
                                                      state: udateAdd,
                                                      onTap: () async {
                                                        if (_addressController
                                                            .text.isNotEmpty) {
                                                          setState(() {
                                                            udateAdd = true;
                                                          });

                                                          try {
                                                            var payload = Jwt
                                                                .parseJwt(widget
                                                                    .accessToken);
                                                            String userid =
                                                                payload["id"]
                                                                    .toString();
                                                            var body = {
                                                              "adress":
                                                                  _addressController
                                                                      .text
                                                            };
                                                            print(
                                                                '${ApiUrl.baseUrl}/api/membres/$userid        ${body}');
                                                            var dio =
                                                                await CustomDio()
                                                                    .getApiClient();
                                                            final response =
                                                                await dio.patch(
                                                                    '${ApiUrl.baseUrl}/api/membres/$userid',
                                                                    data: json
                                                                        .encode(
                                                                            body),
                                                                    options:
                                                                        Options(
                                                                            headers: {
                                                                          "Content-Type":
                                                                              "application/merge-patch+json"
                                                                        }));
                                                            if (response.statusCode ==
                                                                    200 ||
                                                                response.statusCode ==
                                                                    201) {
                                                              print(response
                                                                  .data);
                                                              _addressController
                                                                  .clear();

                                                              Navigator.pop(
                                                                  context);
                                                              setState(() {
                                                                udateAdd =
                                                                    false;
                                                              });
                                                            }
                                                          } catch (e) {}
                                                        } else {
                                                          return 0;
                                                        }
                                                      },
                                                      height: 40,
                                                      width: 100,
                                                      textColor: Colors.white,
                                                      borderColor:
                                                          ColorsApp.skyBlue,
                                                      loaderColor:
                                                          Colors.white),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      }),
                  InfoComponent(
                      title: Row(children: [
                        Text("Password"),
                        Container(
                            child: Icon(FontAwesomeIcons.pen,
                                size: 12, color: Color(0xFFCFD6D6)),
                            margin: EdgeInsets.only(left: 10))
                      ]),
                      value: "*****",
                      onTap: () {
                        print("eeeeeeeeee");
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) => StatefulBuilder(
                                builder: (BuildContext context,
                                        StateSetter setState) =>
                                    Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0)), //this right here
                                        child: Container(
                                          height: 300,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 8),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      'Ancien mot de passe',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 10.0,
                                                        left: 8),
                                                  ),
                                                  SizedBox(
                                                      child: TextFormField(
                                                    onChanged: (value) {},
                                                    controller:
                                                        _passwordController,
                                                    validator: (value) {
                                                      if (value == "") {
                                                        return "veillez remplir se champs";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: "*****",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  )),
                                                  Container(
                                                    child: Text(
                                                      'Nouveau mot de passe',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        top: 10.0,
                                                        bottom: 10.0,
                                                        left: 8),
                                                  ),
                                                  SizedBox(
                                                      child: TextFormField(
                                                    onChanged: (value) {},
                                                    controller:
                                                        _newpasswordController,
                                                    validator: (value) {
                                                      if (value == "") {
                                                        return "veillez remplir se champs";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: "*****",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButton(
                                                            child: const Text(
                                                              'CANCEl',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            onPressed: () {
                                                              _newpasswordController
                                                                  .clear();

                                                              _passwordController
                                                                  .clear();

                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          Button(
                                                              title: 'Update',
                                                              enabled: true,
                                                              state: udatePass,
                                                              onTap:
                                                                  () async {},
                                                              height: 40,
                                                              width: 100,
                                                              textColor:
                                                                  Colors.white,
                                                              borderColor:
                                                                  ColorsApp
                                                                      .skyBlue,
                                                              loaderColor:
                                                                  Colors.white),
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))));
                      })
                ])),
          ])
        ])
            /*  : Center(
                  child: SpinKitCircle(
                  color: Colors.blue,
                  size: 60,
                ) //Circu  // CircularProgressIndicator(color: ColorsApp.skyBlue),
                  ), */
            ));
  }
}
