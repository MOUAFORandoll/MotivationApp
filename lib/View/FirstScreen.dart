import 'package:Motivation/View/Category/CategoryScreen.dart';
import 'package:Motivation/View/HomeScreen.dart';
import 'package:Motivation/View/NotificationsScreen.dart';
import 'package:Motivation/View/SettingScreen.dart';
import 'package:Motivation/View/UsersMange/profilScreen.dart';
import 'package:Motivation/View/messages/Listmessage.dart';
import 'package:Motivation/View/messages/Message.dart';
import 'package:Motivation/styles/colorApp.dart';
import 'package:Motivation/utils/functions/newMessage.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ScrollController? _scrollController;
  double? _scrollPosition;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController!.position.pixels;
      print(_scrollPosition);
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  int item = 0;
  Widget contenu = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            contenu,
          ],
        ),
        floatingActionButton: (item == 2)
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  newMessage(context);
                })
            : SizedBox(
                height: 0,
              ),
        bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: Colors.black,
            enableFeedback: true,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 10,
            selectedIconTheme: IconThemeData(color: ColorsApp.skyBlue),
            selectedItemColor: ColorsApp.skyBlue,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.home_outlined),
                label: "Accueil",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(Icons.category),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.message),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(Icons.notifications),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.menu),
                label: "Menu",
              ),
            ],
            currentIndex: item,
            onTap: (int index) {
              setState(() {
                item = index;
              });
              if (index == 1) {
                setState(() {
                  contenu = CategoryScreen();
                  print(index);
                });
              } else if (index == 2) {
                setState(() {
                  contenu = ListMessage();
                  print(index);
                });
              } else if (index == 3) {
                setState(() {
                  contenu = NotificationsScreen();
                  print(index);
                });
              } else if (index == 4) {
                setState(() {
                  contenu = SettingScreen();
                  print(index);
                });
              } else {
                setState(() {
                  contenu = HomeScreen();
                  print(index);
                });
              }
            }
            //  controller: _controller,
            ));
  }
}
