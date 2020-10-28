import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LetterClick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.deepPurple[500],
      ),
      width: deviceHeight*0.06,
      height: deviceHeight*0.06,
      alignment: Alignment.center,
      child: Text(
      "A",style: theme.textTheme.headline6.copyWith(fontSize: 30.0),
      ),
    );
  }
}
