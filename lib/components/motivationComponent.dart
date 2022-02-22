import 'package:Motivation/themes/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MotivationComponent extends StatelessWidget {
  MotivationComponent({this.motivation});
  final motivation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width * .4,
        margin: EdgeInsets.only(top: 7),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 18),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.010),
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
                                child: Text("User Name")),
                            Container(
                                padding: EdgeInsets.only(right: 20),
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.010),
                                child: Text("20H30")),
                          ],
                        )
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.menu))
                  ]),
            ),
            Container(
                child: Text(
              "Motivations Populaires",
              textAlign: TextAlign.center,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.010),
                    child: Icon(Icons.favorite)),
                Container(
                    /*  padding: EdgeInsets.only(right: 20),
                    */
                    child: Text("Commentaires")),
                Container(
                    padding: EdgeInsets.only(right: 10),
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.010),
                    child: Text("Partager")),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(8)),
      ),
      onTap: () {
        /*     Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PublicationsByCategory())); */
      },
    );
  }
}
