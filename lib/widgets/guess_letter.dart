import 'package:flutter/material.dart';


class GuessLetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        children: [
          Text("A",style: theme.textTheme.headline6.copyWith(fontSize: 24.0),),
          Container(color: theme.primaryColor, width: 30,height: 2,)
        ],
      ),
    );
  }
}
