import 'package:Motivation/components/button.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:Motivation/utils/Services/routing.dart';
import 'package:flutter/material.dart';

// import 'package:get/get.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  bool enable1 = true;
  bool enable2 = true;

  bool enabled = false;

  bool validator = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      alignment: Alignment.center,
      transformAlignment: AlignmentDirectional.centerStart,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(15),
      /*  decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.bottomRight,
              image: AssetImage('Img/bg-object.png'),
            ),
          ), */
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 15),
          /*   Container(
                  width: double.infinity,
                  child: Center(
                    child: Image.asset(
                      'Img/logoRM.png',
                      width: 100,
                      height: 100,
                    ),
                  )), */
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Connectez vous a votre compte Motivation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*     Text(
                  AppLocalizations.of(context)!.gratuit,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ), */
                SizedBox(
                  height: 10,
                ),
                Text(
                  "phone",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextFormField(
                  controller: phone,
                  validator: (value) {
                    return value == "" ? "veillez remplir se champs" : null;
                  },
                  enabled: enable1,
                  onChanged: (val) {
                    if ((phone.text.isNotEmpty &&
                        pass.text.isNotEmpty &&
                        (RegExp(r'^(0|[1-9]\d*)$').hasMatch(phone.text) &&
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
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 15,
                      bottom: 11,
                      top: 15,
                      right: 15,
                    ),
                    // hintText: AppLocalizations.of(context)!.phonetext,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TextFormField(
                  controller: pass,
                  onSaved: (value) {},
                  validator: (value) {
                    return value == "" ? "veuillez remplir ce champ" : null;
                  },
                  enabled: enable2,
                  keyboardType: TextInputType.phone,
                  obscureText: true,
                  obscuringCharacter: "*",
                  maxLength: 5,
                  onChanged: (val) {
                    if ((phone.text.isNotEmpty &&
                        pass.text.isNotEmpty &&
                        (RegExp(r'^(0|[1-9]\d*)$').hasMatch(phone.text) &&
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                    height: 45,
                    loaderColor: Colors.white,
                    title: "connexion",
                    textColor: Colors.white,
                    itemColor: ColorsApp.skyBlue,
                    borderColor: ColorsApp.skyBlue,
                    state: validator,
                    enabled: enabled,
                    onTap: () async {
                      if ((phone.text.isNotEmpty &&
                          pass.text.isNotEmpty &&
                          (RegExp(r'^(0|[1-9]\d*)$').hasMatch(phone.text) &&
                              phone.text.length == 9))) {
                        setState(() {
                          enable1 = true;
                          enable2 = true;

                          validator = true;
                        });
                        print("access");
                      } else {
                        print("eroorrrrrrrrr");
                      }
                    }),
                SizedBox(
                  height: 70,
                ),
                Button(
                  height: 40,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  title: "S'inscrire",
                  itemColor: Colors.transparent,
                  textColor: ColorsApp.skyBlue,
                  loaderColor: ColorsApp.skyBlue,
                  state: false,
                  enabled: true,
                  onTap: () async {},
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
      )),
    )));
  }

  showAlertDialog(
    BuildContext context,
    String texte1,
    String texte2,
    String texte3,
    String texte4,
  ) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(texte1),
      onPressed: () {},
    );

    Widget retryButton = TextButton(
      child: Text(texte2),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(texte3),
      content: Text(texte4),
      actions: [retryButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
