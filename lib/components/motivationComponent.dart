import 'package:Motivation/components/button.dart';
import 'package:Motivation/model/data/PublicationModel.dart';
import 'package:Motivation/themes/color.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:Motivation/utils/functions/showToast.dart';
import 'package:Motivation/viewmodels/publications_list_view_model.dart';
import 'package:Motivation/viewmodels/users_list_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MotivationComponent extends StatefulWidget {
  MotivationComponent({this.motivation});
  PublicationModel? motivation;

  @override
  _MotivationComponentState createState() => _MotivationComponentState();
}

class _MotivationComponentState extends State<MotivationComponent> {
  bool validator = false;
  bool favory = false;
  var comment = 0;

  TextEditingController newComment = TextEditingController();
  bool save = false;
  @override
  Widget build(BuildContext context) {
    var _listUser = Provider.of<UserListViewModel>(context);
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      margin: EdgeInsets.only(top: 7),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.010),
                        child: CachedNetworkImage(
                          imageUrl: "" /*   ApiUrl.baseUrl + this.user.img */,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                                radius: 20, backgroundImage: imageProvider);
                          },
                          placeholder: (context, url) {
                            return CircleAvatar(
                                /*  backgroundColor: ColorsApp.skyBlue, */
                                radius: 15,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsApp.skyBlue,
                                  ),
                                ));
                          },
                          errorWidget: (context, url, error) {
                            return CircleAvatar(
                                /*  backgroundColor: ColorsApp.skyBlue, */
                                radius: 15,
                                backgroundImage: AssetImage("Img/happy.png"));
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                  widget.motivation!.user!.nom.toString(),
                                  style: TextStyle(fontSize: 12))),
                          Container(
                              padding: EdgeInsets.only(right: 20),
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.010),
                              child: Text("20H30",
                                  style: TextStyle(fontSize: 12))),
                        ],
                      )
                    ],
                  ),
                  InkWell(
                      child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.menu)),
                      onTap: () {
                        showDialog(
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
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                  child: Icon(Icons.close),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  })
                                            ],
                                          ),
                                          Container(
                                            child: Text(
                                              'Choisissez une action',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            margin: EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10.0,
                                                left: 8),
                                          ),
                                          Container(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Button(
                                                  title:
                                                      'Save this Publication',
                                                  enabled: true,
                                                  state: save,
                                                  onTap: () async {
                                                    var data = {
                                                      "user": "/api/users/1",
                                                      "publication":
                                                          "/api/publications/${widget.motivation!.id}"
                                                    };
                                                    print("Save $data");
                                                    setState(() {
                                                      save = true;
                                                    });

                                                    try {
                                                      var verifexistSave =
                                                          await ApiService.getExist(
                                                              "/api/saves?user=1&publication=${widget.motivation!.id}",
                                                              context);
                                                      if (verifexistSave == 0) {
                                                        var postResponse =
                                                            await ApiService()
                                                                .postData(
                                                                    "/api/saves",
                                                                    data);
                                                        print(
                                                            "voila dat -------------------------$postResponse ");
                                                        toastShow(
                                                            "Enregistrement Reusssit",
                                                            Colors.blueGrey,
                                                            context);
                                                      }
                                                      if (verifexistSave == 1) {
                                                        toastShow(
                                                            "Vous avez deja enregistre cette motivation",
                                                            Colors.red,
                                                            context);
                                                        setState(() {
                                                          save = false;
                                                        });
                                                      }

                                                      Navigator.pop(context);
                                                      setState(() {
                                                        save = false;
                                                      });
                                                    } catch (e) {
                                                      toastShow(
                                                          "Echec d'Enregistrement \n Veillez recommencer",
                                                          Colors.blueGrey,
                                                          context);
                                                      setState(() {
                                                        save = false;
                                                      });
                                                    }
                                                  },
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .7,
                                                  textColor: Colors.white,
                                                  borderColor:
                                                      ColorsApp.skyBlue,
                                                  loaderColor: Colors.white)),
                                          Container(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Button(
                                                title: 'Add to Favorite',
                                                enabled: true,
                                                state: favory,
                                                onTap: () async {
                                                  var data = {
                                                    "user": "/api/users/1",
                                                    "publication":
                                                        "/api/publications/${widget.motivation!.id}"
                                                  };
                                                  print("Favory $data");
                                                  setState(() {
                                                    favory = true;
                                                  });
                                                  try {
                                                    var verifexistFavory =
                                                        await ApiService.getExist(
                                                            "/api/favories?user=1&publication=${widget.motivation!.id}",
                                                            context);
                                                    if (verifexistFavory == 0) {
                                                      var postResponse =
                                                          await ApiService()
                                                              .postData(
                                                                  "/api/favories",
                                                                  data);
                                                      print(
                                                          "voila dat -------------------------$postResponse ");
                                                      toastShow(
                                                          "Ajout aux favory Reusssit",
                                                          Colors.blueGrey,
                                                          context);
                                                    }
                                                    if (verifexistFavory == 1) {
                                                      toastShow(
                                                          "Vous avez deja enregistre cette motivation",
                                                          Colors.red,
                                                          context);
                                                      setState(() {
                                                        save = false;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      favory = false;
                                                    });
                                                  } catch (e) {
                                                    toastShow(
                                                        "Echec d'ajout au favories \n Veillez recommencer",
                                                        Colors.blueGrey,
                                                        context);
                                                    setState(() {
                                                      favory = false;
                                                    });
                                                  }
                                                },
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .7,
                                                textColor: Colors.white,
                                                borderColor: ColorsApp.skyBlue,
                                                loaderColor: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      })
                ]),
          ),
          Container(
              height: MediaQuery.of(context).size.height * .4,
              alignment: Alignment.center,
              child: Text(
                widget.motivation!.content.toString(),
                textAlign: TextAlign.center,
              )),
          Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0x12094209)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                      child: Row(
                        children: [
                          Text("${widget.motivation!.likes!.length}"),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xE5F879F8),
                              )),
                        ],
                      )),
                  Container(
                      /*  padding: EdgeInsets.only(right: 20),
                    */
                      child: Row(
                    children: [
                      Text("${widget.motivation!.comments!.length}"),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                          child: Text("Commentaires")),
                    ],
                  )),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                      child: Row(
                        children: [
                          Text("${widget.motivation!.partages!.length}"),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                              child: Text("Partages")),
                        ],
                      )),
                ],
              )),
          Container(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                                  child: Icon(
                                    Icons.favorite_border,
                                    /*   color: ColorsApp.skyBlue, */
                                  )),
                              Text("J'aime"),
                            ],
                          )),
                      onTap: () async {
                        var data = {
                          "libelle": newComment.text,
                          "user": "/api/users/1",
                          "publication":
                              "/api/publications/${widget.motivation!.id}"
                        };
                        print("comenrenrne $data");

                        try {
                          newComment.clear();
                          var postResponse =
                              await ApiService().postData("/api/likes", data);
                          print(
                              "voila dat -------------------------$postResponse ");
                          toastShow("Vous avez Like", Colors.blueGrey, context);
                        } catch (e) {
                          toastShow("Erreur de Like", Colors.blueGrey, context);
                        }
                      }),
                  InkWell(
                    child: Container(
                        /*  padding: EdgeInsets.only(right: 20),
                    */
                        child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                            child: Icon(
                              FontAwesomeIcons.comment,
                              color: ColorsApp.skyBlue,
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                            child: Text("Commenter")),
                      ],
                    )),
                    onTap: () {
                      print("${widget.motivation!.id}");
                      if (comment == widget.motivation!.id) {
                        setState(() {
                          comment = 0;
                        });
                      } else {
                        setState(() {
                          comment = 0;
                          comment = widget.motivation!.id!;
                        });
                      }
                      print("voici newww comment $comment");
                    },
                  ),
                  InkWell(
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                                  child: Icon(
                                    FontAwesomeIcons.share,
                                    color: ColorsApp.skyBlue,
                                  )),
                              Container(
                                  padding: EdgeInsets.only(left: 10),
                                  /*   margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.010), */
                                  child: Text("Partager")),
                            ],
                          )),
                      onTap: () {
                        showModalBottomSheet(
                            barrierColor: Colors.grey,
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) => SafeArea(
                                child: StatefulBuilder(
                                    builder:
                                        (BuildContext context,
                                                StateSetter mystate) =>
                                            Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.3,
                                                child: SafeArea(
                                                    child: Column(children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20, right: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Partager cette Motivation ",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextButton(
                                                                child: Text(
                                                                  "Annuler",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: ColorsApp
                                                                          .skyBlue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                }),
                                                          ])),
                                                  Expanded(
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 15),
                                                          child: Column(
                                                              children: [
                                                                (ListView
                                                                    .separated(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      ClampingScrollPhysics(),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return _listUser.loadingStatusUser ==
                                                                            LoadingStatusUser
                                                                                .comppleted
                                                                        ? InkWell(
                                                                            child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF5A7E6C),
                                                                                  border: Border.all(color: Colors.grey),
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                width: MediaQuery.of(context).size.width * .3,
                                                                                /*   height:
                                            MediaQuery.of(context).size.height *
                                                0.08, */
                                                                                padding: EdgeInsets.only(left: 5, right: 5 /* , top: 3*/),
                                                                                margin: EdgeInsets.only(left: 5, right: 5, top: 3),
                                                                                child: ListTile(
                                                                                  /*     leading: Container(
                                                                                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
                                                                                child: CachedNetworkImage(
                                                                                  imageUrl: (_listMembres[index].image != null) ? ApiUrl.baseUrl + _listMembres[index].image!.contentUrl : "",
                                                                                  imageBuilder: (context, imageProvider) {
                                                                                    return CircleAvatar(
                                                                                        /*   backgroundColor: ColorsApp.skyBlue, */

                                                                                        radius: 25,
                                                                                        backgroundImage: imageProvider);
                                                                                  },
                                                                                  placeholder: (context, url) {
                                                                                    return CircleAvatar(
                                                                                        /*  backgroundColor: ColorsApp.skyBlue, */
                                                                                        radius: 25,
                                                                                        child: Center(
                                                                                          child: CircularProgressIndicator(
                                                                                            color: ColorsApp.skyBlue,
                                                                                          ),
                                                                                        ));
                                                                                  },
                                                                                  errorWidget: (context, url, error) {
                                                                                    return CircleAvatar(
                                                                                        /*  backgroundColor: ColorsApp.skyBlue, */
                                                                                        radius: 25,
                                                                                        backgroundImage: AssetImage("Img/happy.png"));
                                                                                  },
                                                                                ),
                                                                              ),
                                                                             */
                                                                                  onTap: () {},
                                                                                  title: Text("${_listUser.listUser[index].nom}  ${_listUser.listUser[index].prenom}"),
                                                                                  subtitle: Text("${_listUser.listUser[index].numero}"),
                                                                                  trailing: Container(
                                                                                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                                                                                      child: Icon(
                                                                                        FontAwesomeIcons.arrowRight,
                                                                                        color: Color(0xFF6161F8),
                                                                                      )),
                                                                                )),
                                                                          )
                                                                        : _listUser.loadingStatusUser ==
                                                                                LoadingStatusUser.searching
                                                                            ? Center(
                                                                                child: SpinKitCircle(
                                                                                color: Colors.blue,
                                                                                size: 40,
                                                                              ))
                                                                            : Container(padding: EdgeInsets.only(top: 7, left: 10, right: 10, bottom: 7), child: Text("Aucun Utilisateur disponible"));
                                                                  },
                                                                  separatorBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return SizedBox(
                                                                      height: 0,
                                                                    );
                                                                  },
                                                                  itemCount:
                                                                      _listUser
                                                                          .listUser
                                                                          .length,
                                                                ))
                                                              ])))
                                                ]))))));
                      }),
                ],
              )),
          (comment == widget.motivation!.id!)
              ? Container(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * .77,
                          height: MediaQuery.of(context).size.height * .08,
                          padding: EdgeInsets.only(top: 7),
                          child: TextFormField(
                            // enabled: enableMail,
                            // textCapitalization: TextCapitalization.words,
                            onChanged: (value) {},
                            controller: newComment,
                            validator: (value) {
                              if (value == "") {
                                return "veillez remplir se champs";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    // width: 10
                                  )),
                              fillColor: Colors.grey,
                              hintText: "Votre commentaire",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 7),
                          child: Button2(
                              height: 45,
                              width: 120,
                              icon: Icons.send,
                              textColor: Colors.white,
                              itemColor: ColorsApp.skyBlue,
                              loaderColor: Colors.white,
                              enabled:
                                  newComment.text.isNotEmpty ? true : false,
                              state: validator,
                              onTap: () async {
                                var data = {
                                  "libelle": newComment.text,
                                  "user": "/api/users/1",
                                  "publication":
                                      "/api/publications/${widget.motivation!.id}"
                                };
                                print("comenrenrne $data");
                                setState(() {
                                  validator = true;
                                });
                                try {
                                  newComment.clear();
                                  var postResponse = await ApiService()
                                      .postData("/api/comments", data);
                                  print(
                                      "voila dat -------------------------$postResponse ");
                                  toastShow("Commentaire Reusssit",
                                      Colors.blueGrey, context);
                                  setState(() {
                                    validator = false;
                                  });
                                } catch (e) {
                                  toastShow("Erreur de commentaire",
                                      Colors.blueGrey, context);
                                  setState(() {
                                    validator = false;
                                  });
                                }
                              }))
                    ],
                  ))
              : (comment == 0)
                  ? Container(height: 0, width: 0)
                  : Container(height: 0, width: 0),
        ],
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
    );
  }
}
