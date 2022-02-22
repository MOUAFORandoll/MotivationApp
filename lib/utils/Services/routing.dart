import 'package:Motivation/View/AboutUsScreen.dart';
import 'package:Motivation/View/HomeScreen.dart';
import 'package:Motivation/View/UsersMange/LoginScreen.dart';
import 'package:Motivation/View/UsersMange/RegisterScreen.dart';
import 'package:flutter/material.dart';
 
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AppLinks.LOGIN, page: () => LoginScreen()),
    GetPage(name: AppLinks.HOME, children: [], page: () => HomeScreen()),
    GetPage(name: AppLinks.REGISTER, page: () => RegisterScreen()),
    GetPage(name: AppLinks.ABOUTUS, page: () => AboutUsScreen()),
  ];
}

class AppLinks {
  static const String LOGIN = "/login";
  static const String HOME = "/home";
  static const String REGISTER = "/register";
  static const String ABOUTUS = "/aboutus";
}
