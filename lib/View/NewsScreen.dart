import 'package:Motivation/components/motivationComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsScreenScreen extends StatelessWidget {
  const NewsScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(right: 20), child: Icon(Icons.add)),
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
                    /*     Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PublicationsByCategory())); */
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
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    (ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, index) =>
                            GestureDetector(
                                onLongPress: () {},
                                onTap: () async {},
                                child: MotivationComponent())))
                  ],
                ))
          ],
        )),
      ),
    ])));
  }
}
