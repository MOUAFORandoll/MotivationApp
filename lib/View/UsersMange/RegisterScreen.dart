import 'package:Motivation/utils/Services/routing.dart';
import 'package:flutter/material.dart';

 
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("Register Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppLinks.ABOUTUS),
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
