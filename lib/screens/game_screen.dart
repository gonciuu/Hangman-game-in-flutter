import 'package:flutter/material.dart';
import 'package:hangman/http/random_word.dart';
import 'package:hangman/models/alphabel_letter.dart';
import 'package:hangman/models/game.dart';
import '../models/guess_letter_model.dart';
import '../widgets/guess_letter.dart';
import '../widgets/letter_click.dart';

class GameScreen extends StatefulWidget {
  static const routeName = "/game";

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final RandomWord _randomWordApi = RandomWord();
  final Game game = Game(time: 0,score: 0,lives: 10, word: "Hangman");

  //random word letters
  List<GuessLetterModel> guessedLetters = List();
  //alphabet
  List<AlphabetLetter> clickAlphabetLetters = List();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: theme.accentColor,
      body: SafeArea(
        child: guessedLetters.isEmpty
            ? Center(
                child: Text(
                  "Generating word...",
                  style: theme.textTheme.headline6
                      .copyWith(fontSize: 32.0, color: theme.primaryColor),
                ),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    height: deviceHeight * 0.2,
                    width: double.infinity,
                    color: theme.primaryColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "lives : ${this.game.lives}",
                          style: theme.textTheme.headline5,
                        ),
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Hangman.svg/1200px-Hangman.svg.png',
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "0:30",
                          style: theme.textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        child: Text(
                          game.word,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: theme.primaryColor,
                              fontFamily: "ArchitectsDaughter"),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: theme.primaryColor,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //setup word in guessLetter widget
                      ...this
                          .guessedLetters
                          .map((letter) =>
                              GuessLetter(letter.title, letter.isGuessed))
                          .toList()
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        //show alphabet
                        ...this.clickAlphabetLetters.map((letter) =>
                          LetterClick(letter.title,letter.isChoose,letter.isContainsInWord,alphabetLetterClick)
                        ).toList()
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  //----------------| Get random word |---------------------
  Future getWord() async {
    Map map = await _randomWordApi.getWord();
    setState(() {
      this.game.word = map['word'];
      for (int i = 0; i < this.game.word.length; i++)
        guessedLetters.add(GuessLetterModel(this.game.word[i], false));
        getAlphabet();
    });
  }

  //========================================================

  //----------------| get alphabel and setup it into list |---------------------
  void getAlphabet() => setState(() => AlphabetLetter.alphabet.forEach((letter) => this.clickAlphabetLetters.add(AlphabetLetter(letter.toUpperCase(),false,this.game.word.contains(letter)))));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWord();
  }

  //---------------------| handle alphabet letter click |------------------------------
  void alphabetLetterClick(String title){
    bool isContains = false;
    setState(() {
      //set letter as guessed
      for (int i = 0; i < this.game.word.length; i++){
        if(this.game.word[i].toUpperCase() == title){
          guessedLetters[i].isGuessed = true;
          isContains = true;
        }
      }
      if(!isContains) this.game.lives--;
      //set alphabet letter as choose
      this.clickAlphabetLetters.where((letter) => letter.title==title).toList()[0].isChoose = true;
    });
  }
  //====================================================================================
}
