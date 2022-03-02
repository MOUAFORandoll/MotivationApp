import 'dart:io';

import 'package:Motivation/ViewModels/Category_list_view_model.dart';
import 'package:Motivation/components/button.dart';
import 'package:Motivation/components/colorSelect.dart';
import 'package:Motivation/components/motivationComponent.dart';
import 'package:Motivation/model/data/PublicationModel.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:Motivation/utils/functions/showToast.dart';
import 'package:Motivation/viewmodels/publications_list_view_model.dart';
import 'package:Motivation/viewmodels/users_list_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("TEXT"), value: "/api/type_publications/1"),
      DropdownMenuItem(child: Text("IMAGE"), value: "/api/type_publications/2"),
      DropdownMenuItem(child: Text("VIDEO"), value: "/api/type_publications/3"),
    ];
    return menuItems;
  }

  List _listColor = [
    0xFF16E986,
    0xff011d10,
    0xFFC419EE,
    0xFF8519B8,
    0xFF433F3C,
    0xFFC2A91C,
    0xFF871DCE,
    0xFF2A0A74,
    0xFFE4E6EE,
    0xFF069B56,
    0xFF373D3A,
    0xFFCEA972,
    0xFF03112B,
    0xFF2C2E2D,
    0xFFD1C624,
    0xFF188879,
    0xFF320D97,
    0xFF433F3C,
    0xFFF7F6EF,
    0xE3A146D6,
    0xFF2A0A74,
    0xFF1D1E20,
    0xFF1DEE8D,
    0x8E860860,
    0xFF593E15,
    0xFFDA3E1B,
  ];
  bool validator = false;
  bool colorget = false;
  TextEditingController newPub = TextEditingController();

  String selectedValue = "/api/type_publications/1";

  String category = "/api/categories/1";
  int couleur = 0xFFFFFFFF;
  addMotivation(context) {
    return showModalBottomSheet(
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
                                      "Nouv. Motivation ",
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
                                          mystate(() {
                                            selectedValue =
                                                "/api/type_publications/1";

                                            category = "/api/categories/1";
                                          });
                                          Navigator.of(context).pop();
                                        }),
                                  ])),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Categorie"),
                                      DropdownButton(
                                          value: selectedValue,
                                          onChanged: (String? newValue) {
                                            mystate(() {
                                              selectedValue = newValue!;
                                            });
                                          },
                                          items: dropdownItems)
                                    ],
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        (selectedValue ==
                                                "/api/type_publications/1")
                                            ? Column(children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 30, top: 20),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "Select The font Color of your motivation"),
                                                          InkWell(
                                                              child: Text(
                                                                  "Select"),
                                                              onTap: () {
                                                                print(
                                                                    "Ici on doit afficher un carre qui continet des couleur");
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (BuildContext context) => StatefulBuilder(
                                                                        builder: (BuildContext context, StateSetter setState) => Dialog(
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), //this right here
                                                                            child: Container(
                                                                                // height: 180,
                                                                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                                                                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                      'Choisissez une Couleur',
                                                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 8),
                                                                                  ),
                                                                                  Container(
                                                                                      width: MediaQuery.of(context).size.width * .95,
                                                                                      height: MediaQuery.of(context).size.height * .7,
                                                                                      child: GridView.count(crossAxisCount: 4, children: [
                                                                                        for (var i = 0; i < _listColor.length; i++)
                                                                                          InkWell(
                                                                                              child: Container(margin: EdgeInsets.all(5), height: 30, width: 30, decoration: BoxDecoration(color: Color(_listColor[i]))),
                                                                                              onTap: () {
                                                                                                colorget = true;
                                                                                                couleur = _listColor[i];
                                                                                                Navigator.pop(context);
                                                                                                mystate(() {
                                                                                                  couleur = _listColor[i];
                                                                                                  colorget = false;
                                                                                                });
                                                                                              })
                                                                                      ]))
                                                                                ])))));
                                                              })
                                                        ])),
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: (colorget)
                                                      ? SpinKitCircle(
                                                          color: Colors.blue,
                                                          size: 40,
                                                        )
                                                      : Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      couleur))),
                                                ),
                                                TextFormField(
                                                  // enabled: enableMail,
                                                  // textCapitalization: TextCapitalization.words,
                                                  maxLength: 1000,
                                                  onChanged: (value) {},
                                                  controller: newPub,
                                                  validator: (value) {
                                                    if (value == "") {
                                                      return "veillez remplir se champs";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          // width: 10
                                                        )),
                                                    fillColor: Colors.grey,
                                                    hintText: "Message",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                )
                                              ])
                                            : (selectedValue ==
                                                    "/api/type_publications/2")
                                                ? Column(children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 6),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            "Select the picture")),
                                                    /*     Padding(
        padding: const EdgeInsets.all(8.0),
        child:  GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                maxCrossAxisExtent:
                                                                    200,
                                                                childAspectRatio:
                                                                    3 / 2,
                                                                crossAxisSpacing:
                                                                    20,
                                                                mainAxisSpacing:
                                                                    20),
                                                        itemCount:
                                                           10,
                                                        itemBuilder:
                                                            (BuildContext ctx,
                                                                index) {
                                                          return Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                               "name"),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .amber,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                          );
                                                        }) ),*/
                                                    Row(
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 5,
                                                                    left: 5),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: "",
                                                              imageBuilder:
                                                                  (context,
                                                                      imageProvider) {
                                                                return Container(
                                                                  height: 150,
                                                                  width: 150,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    /*  color: ColorsApp.pink, */
                                                                    /*   borderRadius: BorderRadius.circular(10), */
                                                                    image: DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .cover),
                                                                    border: Border.all(
                                                                        width:
                                                                            0.2,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                );
                                                              },
                                                              placeholder:
                                                                  (context,
                                                                      url) {
                                                                return Container(
                                                                    height: 150,
                                                                    width: 150,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            width:
                                                                                0.2,
                                                                            color: Colors
                                                                                .grey)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: ColorsApp
                                                                            .skyBlue,
                                                                      ),
                                                                    ));
                                                              },
                                                              errorWidget:
                                                                  (context, url,
                                                                      error) {
                                                                return Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              0.2,
                                                                          color:
                                                                              Colors.grey)),
                                                                  height: 150,
                                                                  width: 150,
                                                                  child: Icon(
                                                                    Icons.error,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                );
                                                              },
                                                            )),
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.2,
                                                                    color: Colors
                                                                        .grey)),
                                                            height: 150,
                                                            width: 150,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 30,
                                                                    top: 20),
                                                            child: InkWell(
                                                              child: Icon(
                                                                  Icons.add),
                                                              onTap: () async {
                                                                File image = await ImagePicker.pickImage(
                                                                    source: ImageSource
                                                                        .gallery,
                                                                    maxHeight:
                                                                        double
                                                                            .infinity,
                                                                    maxWidth: double
                                                                        .infinity,
                                                                    imageQuality:
                                                                        100);
                                                                /*  setState(() {
                                                    if (!images.path
                                                        .contains(image.path)) {
                                                      images = image;
                                                      print(images.path);
                                                    }
                                                  }); */
                                                                if (image.path
                                                                    .isEmpty) {
                                                                  print(
                                                                      "required image");
                                                                }
                                                              },
                                                            )),
                                                      ],
                                                    )
                                                  ])
                                                : Text("Not implement Video"),
                                        Container(
                                            padding: EdgeInsets.only(
                                                bottom: 30, top: 20),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Select The Category of your motivation"),
                                                  InkWell(
                                                      child: Text("Select"),
                                                      onTap: () {
                                                        print(
                                                            "Ici on doit afficher un carre qui continet des couleur");
                                                        showModalBottomSheet(
                                                            barrierColor:
                                                                Colors.grey,
                                                            context: context,
                                                            isScrollControlled:
                                                                true,
                                                            builder: (BuildContext context) => SafeArea(
                                                                child: StatefulBuilder(
                                                                    builder: (BuildContext context, StateSetter mystate) => Container(
                                                                        height: MediaQuery.of(context).size.height / 1.3,
                                                                        child: SafeArea(
                                                                            child: Column(children: [
                                                                          Container(
                                                                              padding: EdgeInsets.only(left: 20, right: 10),
                                                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                Text(
                                                                                  "Selectiooner un cathegorie",
                                                                                  textAlign: TextAlign.left,
                                                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                ),
                                                                                TextButton(
                                                                                    child: Text(
                                                                                      "Annuler",
                                                                                      textAlign: TextAlign.left,
                                                                                      style: TextStyle(fontSize: 15, color: ColorsApp.skyBlue, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                    }),
                                                                              ])),
                                                                          Expanded(
                                                                              child: Container(
                                                                                  padding: EdgeInsets.only(left: 15, right: 15),
                                                                                  child: Column(children: [
                                                                                    (ListView.separated(
                                                                                      shrinkWrap: true,
                                                                                      physics: ClampingScrollPhysics(),
                                                                                      itemBuilder: (BuildContext context, int index) {
                                                                                        return _listCategorie.loadingStatusCategory == LoadingStatusCategory.comppleted
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
                                                                                                      onTap: () {
                                                                                                        setState(() {
                                                                                                          category = "/api/categories/${_listCategorie.listCategory[index].id}";
                                                                                                        });
                                                                                                        Navigator.pop(context);
                                                                                                      },
                                                                                                      title: Text("${_listCategorie.listCategory[index].libelle}  "),
                                                                                                      trailing: Container(
                                                                                                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                                                                                                          child: Icon(
                                                                                                            FontAwesomeIcons.arrowRight,
                                                                                                            color: Color(0xFF6161F8),
                                                                                                          )),
                                                                                                    )),
                                                                                              )
                                                                                            : _listCategorie.loadingStatusCategory == LoadingStatusCategory.searching
                                                                                                ? Center(
                                                                                                    child: SpinKitCircle(
                                                                                                    color: Colors.blue,
                                                                                                    size: 40,
                                                                                                  ))
                                                                                                : Container(padding: EdgeInsets.only(top: 7, left: 10, right: 10, bottom: 7), child: Text("Aucun Utilisateur disponible"));
                                                                                      },
                                                                                      separatorBuilder: (BuildContext context, int index) {
                                                                                        return SizedBox(
                                                                                          height: 0,
                                                                                        );
                                                                                      },
                                                                                      itemCount: _listCategorie.listCategory.length,
                                                                                    ))
                                                                                  ])))
                                                                        ]))))));
                                                      })
                                                ])),
                                        Container(
                                            padding: EdgeInsets.only(top: 7),
                                            child: Button(
                                                height: 45,
                                                width: 120,
                                                title: "Add",
                                                textColor: Colors.white,
                                                itemColor: ColorsApp.skyBlue,
                                                loaderColor: Colors.white,
                                                enabled: newPub.text.isNotEmpty
                                                    ? true
                                                    : false,
                                                state: validator,
                                                onTap: () async {
                                                  var data = {
                                                    "content": newPub.text,
                                                    "user": "/api/users/1",
                                                    "typePublication":
                                                        selectedValue,
                                                    "fontColor":
                                                        couleur.toString(),
                                                    "category": category
                                                  };
                                                  mystate(() {
                                                    validator = true;
                                                  });
                                                  try {
                                                    // newPub.clear();
                                                    var postResponse =
                                                        await ApiService().postData(
                                                            "/api/publications",
                                                            data);
                                                    print(
                                                        "voila dat -------------------------$postResponse ");
                                                    Navigator.pop(context);
                                                    toastShow(
                                                        "Publication Reusssit",
                                                        Colors.blueGrey,
                                                        context);
                                                    mystate(() {
                                                      validator = false;
                                                    });
                                                  } catch (e) {
                                                    toastShow(
                                                        "Erreur de publication",
                                                        Colors.blueGrey,
                                                        context);
                                                    mystate(() {
                                                      validator = false;
                                                    });
                                                  }
                                                }))
                                      ],
                                    ),
                                  )
                                ])),
                          )
                        ])),
                      )),
            ));
  }

  @override
  void initState() {
    Provider.of<PublicationListViewModel>(context, listen: false).getAllPub();
    Provider.of<UserListViewModel>(context, listen: false).getAllUser();

    Provider.of<CategorieListViewModel>(context, listen: false)
        .getAllCategories();
    // TODO: implement initState
    super.initState();
  }

  var _listCategorie;
  @override
  Widget build(BuildContext context) {
    var _listPublication = Provider.of<PublicationListViewModel>(context);

    _listCategorie = Provider.of<CategorieListViewModel>(context);
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        padding: EdgeInsets.only(top: 18, bottom: 18),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              "Home",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20),
                child: InkWell(
                    child: Icon(Icons.add),
                    onTap: () {
                      addMotivation(context);
                    }),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
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
            ],
          )
        ]),
      ),
      Expanded(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .45,
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(
                      30,
                    ),
                    alignment: Alignment.center,
                    child: Column(children: [
                      Container(child: Icon(Icons.add)),
                      Text(
                        "Creer une motivation",
                        textAlign: TextAlign.center,
                      )
                    ]),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onTap: () {
                    addMotivation(context);
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .45,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(
                      30,
                    ),
                    alignment: Alignment.center,
                    child: Column(children: [
                      Container(child: Icon(Icons.favorite)),
                      Text(
                        "Motivations Populaires",
                        textAlign: TextAlign.center,
                      )
                    ]),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onTap: () {
                    /*     Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PublicationsByCategory())); */
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 8),
              child: _listPublication.loadingStatus == LoadingStatus.comppleted
                  ? Column(
                      children: [
                        StreamBuilder(
                            initialData: _listPublication.listPub,
                            stream: Stream.periodic(Duration(seconds: 5))
                                .asBroadcastStream()
                                .asyncMap((i) => _listPublication.listPub),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return GestureDetector(
                                        onLongPress: () {},
                                        onTap: () async {},
                                        child: MotivationComponent(
                                          motivation: snapshot.data[index],
                                        ));
                                  });
                            })
                      ],
                    )
                  : _listPublication.loadingStatus == LoadingStatus.searching
                      ? Center(
                          child: SpinKitCircle(
                          color: Colors.blue,
                          size: 40,
                        ))
                      : Container(
                          padding: EdgeInsets.only(
                              top: 7, left: 10, right: 10, bottom: 7),
                          child: Text("rien a afficher")),
            )
          ],
        )),
      ),
    ])));
  }
}
