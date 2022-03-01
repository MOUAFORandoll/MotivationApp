import 'package:Motivation/View/FirstScreen.dart';
import 'package:Motivation/View/UsersMange/LoginScreen.dart';
import 'package:Motivation/View/UsersMange/RegisterScreen.dart';
import 'package:Motivation/ViewModels/Favoritepublications_list_view_model.dart';
import 'package:Motivation/ViewModels/SavePublications_list_view_model.dart';
import 'package:Motivation/viewmodels/publications_list_view_model.dart';
import 'package:Motivation/viewmodels/users_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// @dart=2.9
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => PublicationListViewModel()),
          ChangeNotifierProvider(create: (_) => UserListViewModel()),
          ChangeNotifierProvider(create: (_) => SavePublicationListViewModel()),
          ChangeNotifierProvider(
              create: (_) => FavoritePublicationListViewModel())
        ], child: FirstScreen()));
  }
}
