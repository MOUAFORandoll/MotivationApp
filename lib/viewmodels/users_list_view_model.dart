import 'package:Motivation/model/data/UserModel.dart';
import 'package:Motivation/utils/Services/requestServices.dart';
import 'package:flutter/material.dart';

enum LoadingStatusUser { comppleted, searching, empty }

class UserListViewModel with ChangeNotifier {
  LoadingStatusUser loadingStatusUser = LoadingStatusUser.empty;
  List<UserModel> listUser = [];
  getAllUser() async {
    loadingStatusUser = LoadingStatusUser.searching;
    this.listUser = await ApiService.getUsers();

    notifyListeners();
    if (this.listUser.isEmpty) {
      loadingStatusUser = LoadingStatusUser.empty;
    } else {
      loadingStatusUser = LoadingStatusUser.comppleted;
    }
    notifyListeners();
    // print("*************************$listUser[0]");
    return listUser;
  }
}
