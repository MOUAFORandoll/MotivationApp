import 'package:Motivation/model/data/PublicationModel.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:flutter/material.dart';

enum LoadingStatusFavorite { comppleted, searching, empty }

class FavoritePublicationListViewModel with ChangeNotifier {
  LoadingStatusFavorite loadingStatusFavorite = LoadingStatusFavorite.empty;
  List<PublicationModel> listFavoritePub = [];
  getFavoritePub() async {
    loadingStatusFavorite = LoadingStatusFavorite.searching;
    this.listFavoritePub = await ApiService.getFavoritePublications();
    // this.listFavoritePub = result.map((e) => PublicationViewModel(e)).toList();

    notifyListeners();
    if (this.listFavoritePub.isEmpty) {
      loadingStatusFavorite = LoadingStatusFavorite.empty;
    } else {
      loadingStatusFavorite = LoadingStatusFavorite.comppleted;
    }
    notifyListeners();
    // print("*************************$listFavoritePub[0]");
    return listFavoritePub;
  }
}
