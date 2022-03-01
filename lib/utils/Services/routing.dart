import 'package:Motivation/View/AboutUsScreen.dart';
import 'package:Motivation/View/Category/PublicationsByCategory.dart';
import 'package:Motivation/View/FirstScreen.dart';
import 'package:Motivation/View/Publications/FavoritePublicationsScreen.dart';
import 'package:Motivation/View/Publications/SavingPublicationsList.dart';
import 'package:Motivation/View/UsersMange/LoginScreen.dart';
import 'package:Motivation/View/UsersMange/RegisterScreen.dart';
import 'package:Motivation/View/UsersMange/profilScreen.dart';
import 'package:Motivation/View/messages/Message.dart';
import 'package:flutter/material.dart';

// import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
 //   GetPage(name: AppLinks.LOGIN, page: () => LoginScreen()),
    // GetPage(name: AppLinks.HOME, children: [], page: () => HomeScreen()),
    // GetPage(name: AppLinks.REGISTER, page: () => RegisterScreen()),
    // GetPage(name: AppLinks.ABOUTUS, page: () => AboutUsScreen()),
    // GetPage(name: AppLinks.PROFILE, page: () => ProfileUserScreen()),
    // GetPage(name: AppLinks.ADDPUB, page: () => AddPublicationScreen()),
    // GetPage(
    //     name: AppLinks.SAVINGPUB, page: () => SavingPublicationListScreen()),
    // GetPage(name: AppLinks.MESSAGESCREEN, page: () => MessageScreen()),
    // GetPage(
    //     name: AppLinks.PUBLICATINBYCATEGORY, page: () => PublicationsByCategory()),
    // GetPage(
    //     name: AppLinks.SAVINGPUB, page: () => SavingPublicationListScreen()),
    // GetPage(
    //     name: AppLinks.SAVINGPUB, page: () => SavingPublicationListScreen()),
  ];
}

class AppLinks {
  static const String LOGIN = "/login";
  static const String HOME = "/home";
  static const String REGISTER = "/register";
  static const String ABOUTUS = "/aboutus";

  static const String PROFILE = "/profile";
  static const String ADDPUB = "/addpub";
  static const String SAVINGPUB = "/savingpub";
  static const String MESSAGESCREEN = "/messagescreen";
  static const String PUBLICATINBYCATEGORY = "/publicationbycategory";
}
