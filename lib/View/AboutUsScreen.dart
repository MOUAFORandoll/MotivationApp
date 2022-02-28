import 'package:Motivation/utils/Services/routing.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AboutUs"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("AboutUs Screen"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.toNamed(AppLinks.HOME),
      //   child: Icon(Icons.ac_unit),
      // ),
    );
  }
}
