import 'package:flutter/material.dart';
import 'package:hangman/screens/game_screen.dart';
import 'package:hangman/screens/main_menu_screen.dart';

class LoseScreen extends StatelessWidget {
  static const String routeName = '/lose-screen';

  @override
  Widget build(BuildContext context) {
    final String points = ModalRoute
        .of(context)
        .settings
        .arguments
        .toString();
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.accentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://cdn.pixabay.com/photo/2016/03/31/19/46/cackle-1295277_960_720.png',
                scale: 2.5),
            SizedBox(
              height: 30,
            ),
            Text(
              "YOU\nLOSE",
              textAlign: TextAlign.center,
              style:
              theme.textTheme.headline1.copyWith(color: theme.primaryColor),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              splashColor: theme.primaryColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
              child: FittedBox(
                child: Text("Main Menu", style: theme.textTheme.headline5),
              ),
              color: theme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ), SizedBox(height: 15,),
            FlatButton(
              splashColor: theme.primaryColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                    GameScreen.routeName, (route) => false);
              },
              child: FittedBox(
                child: Text("Play Again", style: theme.textTheme.headline5),
              ),
              color: theme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
          ],
        ),
      ),
    );
  }
}
