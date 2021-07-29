import 'dart:async';

import 'package:bloc_login/home/screens/score/finaltie.dart';
import 'package:bloc_login/home/screens/score/score_picker.dart';
import 'package:bloc_login/home/screens/score/set.dart';
import 'package:bloc_login/home/screens/score/setResult.dart';
import 'package:bloc_login/model/score_model.dart';
import 'package:flutter/material.dart';

class AllGameSets extends StatefulWidget {
  final ValueChanged<AllSetsResult> onChangedSelect;
  ScoreRoundFull data;
  AllGameSets({this.data,this.onChangedSelect});

  @override
  _AllGameSetsState createState() => _AllGameSetsState();
}

class _AllGameSetsState extends State<AllGameSets> {

  @override
  Widget build(BuildContext context) {
    AllSetsResult results = AllSetsResult(scores: List.filled(widget.data.rule.setsToWin, null));
    List winner = List.filled(widget.data.rule.setsToWin, null);
    int countWinner = 0;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for(var i = 0; i < widget.data.rule.setsToWin; i++) GameSet(
            setNum: i+1,
            data: widget.data,
            onChangedSelect: (test){
              results.scores[i] = test.score;
              winner[i] = test.isFirstWin;
              var win = winner.where((item) => item == true).length;
              var lose = winner.where((item) => item == false).length;
              if (win == lose){results.isVisible = true;}else{results.isVisible = false;};
              widget.onChangedSelect(results);
            },
          ),

        ],
      ),
    );
  }
}