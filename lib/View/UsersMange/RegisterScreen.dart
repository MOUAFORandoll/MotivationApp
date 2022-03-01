import 'package:Motivation/components/button.dart';
import 'package:Motivation/themes/color.dart';
import 'package:Motivation/utils/Services/routing.dart';
import 'package:Motivation/utils/provider/auth_provider.dart';
import 'package:flutter/material.dart';
/* 
import 'package:get/get.dart'; */
import 'package:get_storage/get_storage.dart';
import 'package:toast/toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  bool error = false;
  bool is_disable = false;
  late int telephone;
  late String password;
  AuthProvider api = AuthProvider();
  GetStorage box = GetStorage();

  bool validator = false;
  bool validator2 = false;

  bool enabled = false;
  bool enableD = true;
  bool loading = false;
  /* 
  bool enableName = true;
  bool enableMail = true;
  bool enablePasword = true;
  bool enableNumber = true; */
  var phoneSa = '';
  var nom = '';
  var mailSa = '';

  var passSa = '';
  @override
  void initState() {
    super.initState();
    api.onInit();
    print(box);
  }

  bool enabledData = false;
  String payCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              transformAlignment: AlignmentDirectional.centerStart,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      //child:padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "S'inscrire",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          /*  Text(
                             gratuit,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                            ),
                          ), */
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nom d'utilisateur",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  nom,
                                  style: TextStyle(
                                    fontFamily: 'orkney',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                          TextFormField(
                            enabled: enableD,
                            onChanged: (String value) {
                              error = false;

                              if (value.isEmpty) {
                                setState(() {
                                  nom = "";
                                });
                              }
                              if (value.length < 3 || name.text.length < 3) {
                                setState(() {
                                  nom = "Minimun 3 caracteres";
                                });
                              } else {
                                setState(() {
                                  nom = "";
                                });
                              }
                              if ((name.text.isNotEmpty &&
                                  surname.text.isNotEmpty &&
                                  email.text.contains(RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) &&
                                  phone.text.isNotEmpty &&
                                  pass.text.isNotEmpty &&
                                  (RegExp(r'^(0|[1-9]\d*)$')
                                          .hasMatch(phone.text) &&
                                      phone.text.length == 9))) {
                                setState(() {
                                  enabled = true;
                                });
                                print("access");
                              } else {
                                setState(() {
                                  enabled = false;
                                });
                                print("eroorrrrrrrrr");
                              }
                            },
                            onFieldSubmitted: (String value) {},
                            controller: name,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "veillez remplir se champs"
                                  : null;
                            },
                            decoration: new InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    // width: 10
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  bottom: 11,
                                  top: 15,
                                  right: 15,
                                ),
                                hintText: "Nom",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                // errorText: error ? "this field is required" : null,
                                prefixIcon: Icon(Icons.account_box)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Prenom d'utilisateur",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  nom,
                                  style: TextStyle(
                                    fontFamily: 'orkney',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                          TextFormField(
                            enabled: enableD,
                            onChanged: (String value) {
                              error = false;

                              if (value.isEmpty) {
                                setState(() {
                                  nom = "";
                                });
                              }
                              if (value.length < 3 || name.text.length < 3) {
                                setState(() {
                                  nom = "Minimun 3 caracteres";
                                });
                              } else {
                                setState(() {
                                  nom = "";
                                });
                              }
                              if ((name.text.isNotEmpty &&
                                  surname.text.isNotEmpty &&
                                  email.text.contains(RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) &&
                                  phone.text.isNotEmpty &&
                                  pass.text.isNotEmpty &&
                                  (RegExp(r'^(0|[1-9]\d*)$')
                                          .hasMatch(phone.text) &&
                                      phone.text.length == 9))) {
                                setState(() {
                                  enabled = true;
                                });
                                print("access");
                              } else {
                                setState(() {
                                  enabled = false;
                                });
                                print("eroorrrrrrrrr");
                              }
                            },
                            onFieldSubmitted: (String value) {},
                            controller: surname,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "veillez remplir se champs"
                                  : null;
                            },
                            decoration: new InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    // width: 10
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: 15,
                                  bottom: 11,
                                  top: 15,
                                  right: 15,
                                ),
                                hintText: "Prenom",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                // errorText: error ? "this field is required" : null,
                                prefixIcon: Icon(Icons.account_box)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "phone",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  phoneSa,
                                  style: TextStyle(
                                    fontFamily: 'orkney',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                          TextFormField(
                            enabled: enableD,
                            onChanged: (String value) {
                              error = false;

                              if (value.isEmpty) {
                                setState(() {
                                  phoneSa = "";
                                });
                              }
                              if (value.length < 9 || phone.text.length < 9) {
                                setState(() {
                                  phoneSa = "Minimun 9 caracteres";
                                });
                              } else {
                                setState(() {
                                  phoneSa = "";
                                });
                              }
                              if ((name.text.isNotEmpty &&
                                  surname.text.isNotEmpty &&
                                  email.text.contains(RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) &&
                                  phone.text.isNotEmpty &&
                                  pass.text.isNotEmpty &&
                                  (RegExp(r'^(0|[1-9]\d*)$')
                                          .hasMatch(phone.text) &&
                                      phone.text.length == 9))) {
                                setState(() {
                                  enabled = true;
                                });
                                print("access");
                              } else {
                                setState(() {
                                  enabled = false;
                                });
                                print("eroorrrrrrrrr");
                              }
                            },
                            onFieldSubmitted: (String value) {
                              setState(() {
                                //   telephone = int.parse(value);
                              });
                            },
                            controller: phone,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "veillez remplir se champs"
                                  : null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: new InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  // width: 10
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                bottom: 11,
                                top: 15,
                                right: 15,
                              ),
                              hintText: "phonetext",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              // errorText: error ? "this field is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Email",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  mailSa,
                                  style: TextStyle(
                                    fontFamily: 'orkney',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                          TextFormField(
                            enabled: enableD,
                            controller: email,
                            onSaved: (value) {},
                            validator: (value) {
                              return value == ""
                                  ? "veuillez remplir ce champ"
                                  : null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  // width: 10
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                bottom: 11,
                                top: 15,
                                right: 15,
                              ),
                              hintText: "Email",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                if (!val.contains(RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"))) {
                                  setState(() {
                                    mailSa = "mauvaise adresse mail";
                                  });
                                } else {
                                  setState(() {
                                    mailSa = "correct mail address";
                                  });
                                }
                                if (val.isEmpty) {
                                  setState(() {
                                    mailSa = "";
                                  });
                                }
                              }
                              if ((name.text.isNotEmpty &&
                                  surname.text.isNotEmpty &&
                                  email.text.contains(RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) &&
                                  phone.text.isNotEmpty &&
                                  pass.text.isNotEmpty &&
                                  (RegExp(r'^(0|[1-9]\d*)$')
                                          .hasMatch(phone.text) &&
                                      phone.text.length == 9))) {
                                setState(() {
                                  enabled = true;
                                });
                                print("access");
                              } else {
                                setState(() {
                                  enabled = false;
                                });
                                print("eroorrrrrrrrr");
                              }
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "pass",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  passSa,
                                  style: TextStyle(
                                    fontFamily: 'orkney',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                          TextFormField(
                            enabled: enableD,
                            onChanged: (value) {
                              error = true;

                              if (value.length < 5) {
                                setState(() {
                                  passSa = "Minimun 5 caracteres";
                                });
                              } else {
                                setState(() {
                                  passSa = "";
                                });
                              }

                              setState(() {
                                password = value;
                              });

                              if (phone.text.isNotEmpty && value.isNotEmpty) {
                                setState(() {
                                  enabledData = true;
                                });
                                print("Activate ber *********");
                              } else {
                                setState(() {
                                  enabledData = false;
                                });
                                print("DesaActivate ber *********");
                              }
                              if ((name.text.isNotEmpty &&
                                  surname.text.isNotEmpty &&
                                  email.text.contains(RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")) &&
                                  phone.text.isNotEmpty &&
                                  pass.text.isNotEmpty &&
                                  (RegExp(r'^(0|[1-9]\d*)$')
                                          .hasMatch(phone.text) &&
                                      phone.text.length == 9))) {
                                setState(() {
                                  enabled = true;
                                });
                                print("access");
                              } else {
                                setState(() {
                                  enabled = false;
                                });
                                print("eroorrrrrrrrr");
                              }
                            },
                            onFieldSubmitted: (String value) {
                              setState(() {
                                password = value;
                              });
                            },
                            controller: pass,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "enter your password"
                                  : null;
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            obscuringCharacter: "*",
                            maxLength: 5,
                            decoration: new InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  // width: 10
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 15,
                                bottom: 11,
                                top: 15,
                                right: 15,
                              ),
                              hintText: ". . . . . ",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                              // errorText: error ? "this field is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                              height: 45,
                              title: "Register",
                              textColor: Colors.white,
                              itemColor: ColorsApp.skyBlue,
                              loaderColor: Colors.white,
                              enabled: enabled,
                              state: validator,
                              onTap: () async {
                                print("deb");

                                if (phone.text.isEmpty ||
                                    pass.text.isEmpty ||
                                    name.text.isEmpty) {
                                  Toast.show(
                                    "Veillez remplir tout les champs",
                                    context,
                                    duration: 6,
                                    gravity: Toast.BOTTOM,
                                    backgroundColor: Colors.red,
                                  );
                                  return 0;
                                } else if (phone.text.length > 8 &&
                                    pass.text.length == 5 &&
                                    name.text.length >= 3 &&
                                    (RegExp(r'^(0|[1-9]\d*)$')
                                            .hasMatch(phone.text) &&
                                        phone.text.length == 9) &&
                                    (email.text.contains(RegExp(
                                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")))) {
                                  setState(() {
                                    enableD = false;
                                    validator = !validator;
                                  });
                                  var data = <String, dynamic>{
                                    "email": email.text.toLowerCase(),
                                    /*    "roles": ["ROLE_MEMBRE"], */
                                    "password": pass.text,
                                    "nom": name.text,
                                    "prenom": "Prenom",
                                    "phone": phone.text,
                                    "codePhone": payCode,
                                    "adress": "",
                                    "ville": "",
                                    "quartier": "",
                                    "numCni": "",
                                    "nameRep": "",
                                    "prenomRep": "",
                                    /*   "status": true, */
                                    "typemembre": "/api/type_membres/1",
                                    "pays": "",
                                    "latitude": 0,
                                    "longitude": 0
                                  };
                                  print(
                                      "Incription en cours********************* $data");
                                } else {
                                  if (name.text.length < 4) {
                                    Toast.show(
                                      "Le nom doit avoir au moins 3 caracteres",
                                      context,
                                      duration: 6,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor: Colors.red,
                                    );
                                  }

                                  if (phone.text.length < 9) {
                                    Toast.show(
                                      "Veillez entrer un numero correct",
                                      context,
                                      duration: 6,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor: Colors.red,
                                    );
                                  }
                                  if (pass.text.length < 5) {
                                    Toast.show(
                                      "Le mot de passe doit avoir au moins 5 caracteres",
                                      context,
                                      duration: 6,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor: Colors.red,
                                    );
                                  }

                                  if (!(email.text.contains(RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")))) {
                                    Toast.show(
                                      "Entrer une adresse mail correct",
                                      context,
                                      duration: 6,
                                      gravity: Toast.BOTTOM,
                                      backgroundColor: Colors.red,
                                    );
                                  }
                                }
                              }),
                          SizedBox(
                            height: 40,
                          ),
                          Button(
                            height: 40,
                            margin: EdgeInsets.only(left: 40, right: 40),
                            title: "connexion",
                            itemColor: Colors.transparent,
                            loaderColor: ColorsApp.skyBlue,
                            textColor: ColorsApp.skyBlue,
                            state: validator2,
                            enabled: true,
                            onTap: () async {
                              setState(() {
                                validator2 = !validator2;
                              });
                              // Navigator.of(context)
                              //     .pushReplacement(MaterialPageRoute(
                              //         builder: (context) => LogPhone()))
                              //     .then((value) {
                              //   if (mounted) {
                              //     setState(() {
                              //       validator2 = false;
                              //     });
                              //   }
                              // });
                            },
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "terms",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  "contact",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
