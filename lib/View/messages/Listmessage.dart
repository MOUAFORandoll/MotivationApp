import 'package:Motivation/components/conversationsComponent.dart';
import 'package:Motivation/components/messageComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListMessage extends StatelessWidget {
  const ListMessage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
   Container(
        /*    padding: EdgeInsets.only(left: 15, right: 10), */
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              "Conversations ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(top: 18),
          )
        ]),
      ),
      Container(
        padding: EdgeInsets.only(top: 2, bottom: 2),
        width: MediaQuery.of(context).size.width * .9,
        child: TextFormField(
          // enabled: enableMail,
          // textCapitalization: TextCapitalization.words,
          onChanged: (value) {},
          // controller: message,
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
       Expanded(
        child: Container(
            
            margin: EdgeInsets.only(left: 10, right: 10),
            child: (ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: ConversationsComponent(),
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