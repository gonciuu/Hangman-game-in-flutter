import 'package:flutter/material.dart';

class TypeWordScreen extends StatefulWidget {
  @override
  _TypeWordScreenState createState() => _TypeWordScreenState();
}

class _TypeWordScreenState extends State<TypeWordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Player 1 typing",
            style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 28),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            width: 2.0)),
                    labelText: "Type word",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2.0))),
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: FlatButton(
              splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: ((){}),
              child: FittedBox(
                child: Text("Confirm",
                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey[900])),
              ),
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
          ),
        ],
      ),
    );
  }
}
