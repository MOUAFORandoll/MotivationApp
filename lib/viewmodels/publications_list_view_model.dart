import 'package:Motivation/model/data/PublicationModel.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:flutter/material.dart';

enum LoadingStatus { comppleted, searching, empty }

class PublicationListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<PublicationModel> listPub = [];
  getAllPub() async {
    loadingStatus = LoadingStatus.searching;
    this.listPub = await ApiService.getPublications();
    // this.listPub = result.map((e) => PublicationViewModel(e)).toList();

    notifyListeners();
    if (this.listPub.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.comppleted;
    }
    notifyListeners();
    // print("*************************$listPub[0]");
    return listPub;
  }
} 