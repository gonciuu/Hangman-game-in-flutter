import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LetterClick extends StatelessWidget {
  final String title;
  final bool isChoose;
  final bool isContainsInWord;
  LetterClick(this.title,this.isChoose,this.isContainsInWord);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: this.isChoose ? this.isContainsInWord ? Colors.greenAccent[100] : Colors.redAccent[100] : Colors.deepPurple[500],
      ),
      width: deviceHeight*0.06,
      height: deviceHeight*0.06,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
        this.title,style: theme.textTheme.headline6.copyWith(fontSize: 30.0,color: this.isChoose ? this.isContainsInWord ? Colors.green[900] : Colors.white : Colors.white,),
        ),
      ),
    );
  }
}
