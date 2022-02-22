import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBar() {
  return Get.snackbar(
    "Voici",
    "000000000",
    icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 10),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
