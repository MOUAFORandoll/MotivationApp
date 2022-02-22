import 'package:Motivation/View/messages/Message.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ConversationsComponent extends StatelessWidget {
  const ConversationsComponent({this.conversations});
  final conversations;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.010),
        child: CachedNetworkImage(
          imageUrl: "" /*   ApiUrl.baseUrl + this.user.img */,
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(radius: 20, backgroundImage: imageProvider);
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
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MessageScreen()));
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("User Name"),
          Text("20H30"),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Contenu message"), Icon(Icons.read_more)],
      ),
      /*   trailing: Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Color(0xFFC0C0CA),
                )),  */
    )
        /* ,Positioned(
        right: 11,
        top: 11,
        child: new Container(
          padding: EdgeInsets.all(2),
          decoration: new BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            minWidth: 14,
            minHeight: 14,
          ),
          child: Text(
            'fdsfg0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ]) */
        ;
  }
}
