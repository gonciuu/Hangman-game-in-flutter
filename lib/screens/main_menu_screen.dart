import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman/screens/game_screen.dart';
import 'package:hangman/screens/high_score_screen.dart';
import 'package:hangman/screens/info_screen.dart';
import 'package:hangman/screens/type_word_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: theme.accentColor,
        body: Column(
          mainAxisSize:MainAxisSize.max ,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FittedBox(
              child: Text(
                "HANG\nMAN\n_____",
                textAlign: TextAlign.center,
                style: theme
                    .textTheme
                    .headline1
                    .copyWith(color: theme.primaryColor),
              ),
            ),SizedBox( height: deviceHeight*0.1),
            Container(
              width: double.infinity,
              height: deviceHeight*0.24,
              color: theme.primaryColor,
              child: Column(
                mainAxisAlignment:    MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: FlatButton(
                            splashColor: theme.primaryColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () => Navigator.pushNamed(context, GameScreen.routeName,arguments: "")
                            ,
                            child: FittedBox(
                              child: Text("1 Player",style: theme
                                  .textTheme
                                  .headline6),
                            ),
                            color: theme.accentColor,
                            padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: FlatButton(
                            splashColor: theme.primaryColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () => Navigator.pushNamed(context, TypeWordScreen.routeName),
                            child: FittedBox(
                              child: Text("2 Players",style: theme
                                  .textTheme
                                  .headline6),
                            ),
                            color: theme.accentColor,
                            padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          ),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ), Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: FlatButton(
                            splashColor: theme.primaryColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            onPressed: ()=> Navigator.pushNamed(context, HighScoreScreen.routeName),
                            child: FittedBox(
                              child: Text("High scores",style: theme
                                  .textTheme
                                  .headline6),
                            ),
                            color: theme.accentColor,
                            padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: FlatButton(
                            splashColor: theme.primaryColor.withOpacity(0.3),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () =>Navigator.pushNamed(context, InfoScreen.routeName),
                            child: FittedBox(
                              child: Text("Info",style: theme
                                  .textTheme
                                  .headline6),
                            ),
                            color: theme.accentColor,
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          ),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            )
          ],
        ));
  }
}
