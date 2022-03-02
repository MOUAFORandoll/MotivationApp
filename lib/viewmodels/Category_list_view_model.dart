import 'package:Motivation/model/data/CategorieModel.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:flutter/material.dart';

enum LoadingStatusCategory { comppleted, searching, empty }

class CategorieListViewModel with ChangeNotifier {
  LoadingStatusCategory loadingStatusCategory = LoadingStatusCategory.empty;
  List<CategorieModel> listCategory = [];
  getAllCategories() async {
    loadingStatusCategory = LoadingStatusCategory.searching;
    this.listCategory = await ApiService.getAllCategories();
    // this.listCategory = result.map((e) => CategorieViewModel(e)).toList();

    notifyListeners();
    if (this.listCategory.isEmpty) {
      loadingStatusCategory = LoadingStatusCategory.empty;
    } else {
      loadingStatusCategory = LoadingStatusCategory.comppleted;
    }
    notifyListeners();
    // print("*************************$listCategory[0]");
    return listCategory;
  }
} 