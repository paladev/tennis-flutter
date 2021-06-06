import 'package:bloc_login/home/screens/score/score_picker.dart';
import 'package:bloc_login/model/score_model.dart';
import 'package:flutter/material.dart';

class GameSet extends StatefulWidget {
  ScoreRoundFull data;
  GameSet({this.data});
  @override
  _GameSetState createState() => _GameSetState();
}

class _GameSetState extends State<GameSet> {

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Text(
            'Сет 1'
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                  child: Text(
                      widget.data.brief1
                  )
              ),
              Container(
                child: IntegerExample(),
              ),
              Container(
                child: IntegerExample(),
              ),

            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                  child: Text(
                      widget.data.brief2
                  )
              ),
              Container(
                child: IntegerExample(),
              ),
              Container(
                child: IntegerExample(),
              ),

            ],
          ),
        ),
      ],
    ),
    );
  }
}