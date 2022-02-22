import 'package:Motivation/utils/Services/routing.dart';
import 'package:flutter/material.dart';

 
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("Login Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppLinks.REGISTER),
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
