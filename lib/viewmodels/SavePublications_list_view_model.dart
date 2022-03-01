import 'package:Motivation/model/data/PublicationModel.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:flutter/material.dart';

enum LoadingStatusSave { comppleted, searching, empty }

class SavePublicationListViewModel with ChangeNotifier {
  LoadingStatusSave loadingStatusSave = LoadingStatusSave.empty;
  List<PublicationModel> listSavePub = [];
  getsavePub() async {
    loadingStatusSave = LoadingStatusSave.searching;
    this.listSavePub = await ApiService.getPublicationsSave();
    // this.listSavePub = result.map((e) => PublicationViewModel(e)).toList();

    notifyListeners();
    if (this.listSavePub.isEmpty) {
      loadingStatusSave = LoadingStatusSave.empty;
    } else {
      loadingStatusSave = LoadingStatusSave.comppleted;
    }
    notifyListeners();
    // print("*************************$listSavePub[0]");
    return listSavePub;
  }
}
