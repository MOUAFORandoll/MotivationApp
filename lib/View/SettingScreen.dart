import 'dart:io';

import 'package:Motivation/components/SettingBlocComponent.dart';
import 'package:Motivation/components/button.dart';
import 'package:Motivation/components/informationComponent.dart';
import 'package:Motivation/themes/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool imgBool = false, modify = false;

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
                  child: InkWell(
                      child: Text(
                        "Modifier",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.skyBlue),
                      ),
                      onTap: () {
                        setState(() {
                          modify = !modify;
                        });
                      }),
                  padding: EdgeInsets.only(right: 10),
                ),
              ]),
              (modify) ? Modify() : ModifyFirst()
            ],
          )),
    ])));
  }
}

class ModifyFirst extends StatefulWidget {
  const ModifyFirst({Key? key}) : super(key: key);

  @override
  _ModifyFirstState createState() => _ModifyFirstState();
}

class _ModifyFirstState extends State<ModifyFirst> {
  bool imgBool = false;
  var listChild = [
    {"title": "Save", "action": () => print("Save"), "icon": Icons.file_upload},
    {
      "title": "Confidentialites ",
      "action": () => print("Confidentialites"),
      "icon": Icons.add
    },
    {
      "title": " Favorite",
      "action": () => print("Securite"),
      "icon": Icons.favorite_border
    },
    {
      "title": "Configurations",
      "action": () => print("Langue"),
      "icon": Icons.settings
    },
    {
      "title": " Securite",
      "action": () => print("Securite"),
      "icon": Icons.security
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      CachedNetworkImage(
        imageUrl: "" /*   ApiUrl.baseUrl + this.user.img */,
        imageBuilder: (context, imageProvider) {
          return CircleAvatar(radius: 45, backgroundImage: imageProvider);
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
      ),
      SettingBlocComponent(listChild: listChild),
    ]));
  }
}

class Modify extends StatefulWidget {
  const Modify({Key? key}) : super(key: key);

  @override
  _ModifyState createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  bool imgBool = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _phoneontroller = TextEditingController();

  TextEditingController _newpasswordController = TextEditingController();

  bool udateAdd = false;
  bool udatePass = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
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
                  return CircleAvatar(
                    radius: 45,
                    backgroundImage: imageProvider,
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
                                      /*   File image =
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
                                          }); */
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
                  return CircleAvatar(
                    /*  backgroundColor: ColorsApp.skyBlue, */
                    radius: 60,
                    backgroundImage: AssetImage("Img/happy.png"),
                    child: Align(
                      alignment: Alignment(1.0, 0.8),
                      child: (imgBool)
                          ? CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorsApp.skyBlue,
                              child: IconButton(
                                onPressed: () async {
                                  File image = await ImagePicker.pickImage(
                                      source: ImageSource.gallery,
                                      maxHeight: double.infinity,
                                      maxWidth: double.infinity,
                                      imageQuality: 100);
                                  /*  setState(() {
                                                    if (!images.path
                                                        .contains(image.path)) {
                                                      images = image;
                                                      print(images.path);
                                                    }
                                                  }); */
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
              InfoComponent(
                  title: Row(children: [
                    Text("First name"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "Nom",
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
                                          'Votre nom',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _nomController,
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
                                          hintText: "nom",
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
                                                  _nomController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
                                                                .accessToken);
                                                        String userid =
                                                            payload["id"]
                                                                .toString();
                                                        var body = {
                                                          "nom":
                                                              _nomController
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
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
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
                    Text("Last name"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "Prenom",
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
                                          'Votre prenom',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _prenomController,
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
                                          hintText: "prenom",
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
                                                  _prenomController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
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
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
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
                    Text("Phone number"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "Aucun",
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
                                          'Votre numero',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _phoneontroller,
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
                                          hintText: "numero",
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
                                                  _phoneontroller.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_addressController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
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
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
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
                    Text("Email"),
                    Container(
                        child: Icon(FontAwesomeIcons.pen,
                            size: 12, color: Color(0xFFCFD6D6)),
                        margin: EdgeInsets.only(left: 10))
                  ]),
                  value: "email",
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
                                          'Votre Email',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0, left: 8),
                                      ),
                                      SizedBox(
                                          child: TextFormField(
                                        onChanged: (value) {},
                                        controller: _emailController,
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
                                          hintText: "Email",
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
                                                  _emailController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Button(
                                                  title: 'Update',
                                                  enabled: true,
                                                  state: false,
                                                  onTap: () async {
                                                    /*   if (_emailController
                                                        .text.isNotEmpty) {
                                                      setState(() {
                                                        udateAdd = true;
                                                      });

                                                      try {
                                                        var payload =
                                                            Jwt.parseJwt(widget
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
                                                                data:
                                                                    json.encode(
                                                                        body),
                                                                options: Options(
                                                                    headers: {
                                                                      "Content-Type":
                                                                          "application/merge-patch+json"
                                                                    }));
                                                        if (response.statusCode ==
                                                                200 ||
                                                            response.statusCode ==
                                                                201) {
                                                          print(response.data);
                                                          _addressController
                                                              .clear();

                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            udateAdd = false;
                                                          });
                                                        }
                                                      } catch (e) {}
                                                    } else {
                                                      return 0;
                                                    } */
                                                  },
                                                  height: 40,
                                                  width: 100,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white),
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
                                            left: 10.0, right: 10.0, top: 8),
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
                                                controller: _passwordController,
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
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        child: const Text(
                                                          'CANCEl',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        onPressed: () {
                                                          _newpasswordController
                                                              .clear();

                                                          _passwordController
                                                              .clear();

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      Button(
                                                          title: 'Update',
                                                          enabled: true,
                                                          state: false,
                                                          onTap: () async {},
                                                          height: 40,
                                                          width: 100,
                                                          textColor:
                                                              Colors.white,
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
                                    ))));
                  })
            ])),
      ])
    ]));
  }
}
