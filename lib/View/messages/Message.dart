import 'package:Motivation/components/messageComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        /*    padding: EdgeInsets.only(left: 15, right: 10), */
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios_new,
                      size: 20, color: ColorsApp.skyBlue),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CachedNetworkImage(
                imageUrl: "" /*   ApiUrl.baseUrl + this.user.img */,
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                      radius: 20, backgroundImage: imageProvider);
                },
                placeholder: (context, url) {
                  return CircleAvatar(
                      /*  backgroundColor: ColorsApp.skyBlue, */
                      radius: 20,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsApp.skyBlue,
                        ),
                      ));
                },
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                      /*  backgroundColor: ColorsApp.skyBlue, */
                      radius: 20,
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
              )
            ],
          ),
          Row(children: [
            IconButton(
              icon: Icon(Icons.video_call_rounded),
              iconSize: 30,
              color: ColorsApp.skyBlue,
              onPressed: () {
                print("1");
              },
            ),
            IconButton(
              icon: Icon(Icons.call_outlined),
              iconSize: 25,
              color: ColorsApp.skyBlue,
              onPressed: () {
                print("1");
              },
            )
          ]),
        ]),
      ),
      Expanded(
        child: Container(
            width: MediaQuery.of(context).size.width * .8,
            margin: EdgeInsets.only(top: 10),
            child: (ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: MessageComponent(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 2,
                  );
                },
                itemCount: 50))),
      ),
      Container(
        height: 45,
        /*    padding: EdgeInsets.only(left: 15, right: 10), */
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            IconButton(
                icon: Icon(Icons.add, size: 25, color: ColorsApp.skyBlue),
                onPressed: () {
                  /*   Navigator.of(context).pop(); */
                }),
          ]),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width *
                    ((message.text.isEmpty) ? .6 : .7),
                child: TextFormField(
                  // enabled: enableMail,
                  // textCapitalization: TextCapitalization.words,
                  onChanged: (value) {
                    // errorEnmail = false;
                    setState(() {
                      // phone.text = value;
                    });
                  },
                  controller: message,
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
                    hintText: "Message",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          (message.text.isEmpty)
              ? Row(children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt_outlined),
                    iconSize: 30,
                    color: ColorsApp.skyBlue,
                    onPressed: () {
                      print("1");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.microwave),
                    iconSize: 25,
                    color: ColorsApp.skyBlue,
                    onPressed: () {
                      print("1");
                    },
                  )
                ])
              : Row(children: [
                  IconButton(
                    icon: Icon(Icons.arrow_right_alt_rounded),
                    iconSize: 30,
                    color: ColorsApp.skyBlue,
                    onPressed: () {
                      print("1");
                    },
                  ),
                ]),
        ]),
      )
    ])));
  }
}
