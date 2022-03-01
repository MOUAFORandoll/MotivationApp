import 'package:Motivation/ViewModels/FavoritePublications_list_view_model.dart';
import 'package:Motivation/ViewModels/SavePublications_list_view_model.dart';
import 'package:Motivation/components/motivationComponent.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class FavoritePublicationListScreen extends StatefulWidget {
  const FavoritePublicationListScreen({Key? key}) : super(key: key);

  @override
  _FavoritePublicationListScreenState createState() =>
      _FavoritePublicationListScreenState();
}

class _FavoritePublicationListScreenState
    extends State<FavoritePublicationListScreen> {
  void initState() {
    Provider.of<SavePublicationListViewModel>(context, listen: false)
        .getsavePub();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _listPublicationSave =
        Provider.of<FavoritePublicationListViewModel>(context);

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
              "Save Publications",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
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
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 8),
              child: _listPublicationSave.loadingStatusFavorite ==
                      LoadingStatusFavorite.comppleted
                  ? Column(
                      children: [
                        StreamBuilder(
                            initialData: _listPublicationSave.listFavoritePub,
                            stream: Stream.periodic(Duration(seconds: 5))
                                .asBroadcastStream()
                                .asyncMap(
                                    (i) => _listPublicationSave.listFavoritePub),
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
                  : _listPublicationSave.loadingStatusFavorite ==
                          LoadingStatusFavorite.searching
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
