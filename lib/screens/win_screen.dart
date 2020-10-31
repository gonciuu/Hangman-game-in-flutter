import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  static const routeName = "/win-screen";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You win",
          style: theme.textTheme.headline1.copyWith(color: theme.primaryColor),
        ),
        Text(
          "Your score: ${ModalRoute.of(context).settings.arguments}",
          style: theme.textTheme.headline1
              .copyWith(color: theme.primaryColor, fontSize: 28),
        ),
        SizedBox(
          height: 30,
        ),
        FlatButton(
          splashColor: theme.primaryColor.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () {},
          child: FittedBox(
            child: Text("Play Again",
                style: theme.textTheme.headline6
                    .copyWith(color: theme.accentColor)),
          ),
          color: theme.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        SizedBox(
          height: 20,
        ),
        FlatButton(
          splashColor: theme.primaryColor.withOpacity(0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () {},
          child: FittedBox(
            child: Text("Main Menu",
                style: theme.textTheme.headline6
                    .copyWith(color: theme.accentColor)),
          ),
          color: theme.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
