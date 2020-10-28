import 'package:flutter/material.dart';
import 'package:hangman/screens/game_screen.dart';
import 'package:hangman/screens/main_menu_screen.dart';

void main() {
  runApp(Hangman());
}

class Hangman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.greenAccent,
          accentColor: Colors.grey[900],
          fontFamily: "ArchitectsDaughter",
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(fontSize: 70.0),
              headline6: TextStyle(fontSize: 18.0, color: Colors.white))),
      initialRoute: "/",
      routes: {
        '/' : (context) => MainMenu(),
        GameScreen.routeName : (context) => GameScreen(),
      },
    );
  }
}
