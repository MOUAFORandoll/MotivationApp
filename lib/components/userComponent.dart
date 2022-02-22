import 'package:Motivation/View/messages/Message.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({this.user});

  final user;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
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
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MessageScreen()));
      },
      title: Text(" dfsfh"),
      subtitle: Text("gfdhgfdh"),
      /*   trailing: Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Color(0xFFC0C0CA),
                )), */
    ));
  }
}
