import 'package:bloc_login/home/screens/score/score_picker.dart';
import 'package:bloc_login/home/screens/score/setResult.dart';
import 'package:bloc_login/model/score_model.dart';
import 'package:flutter/material.dart';

class GameSet extends StatefulWidget {
  int setNum;
  final ValueChanged<SetResult> onChangedSelect;
  ScoreRoundFull data;
  GameSet({this.setNum, this.data, this.onChangedSelect});
  @override
  _GameSetState createState() => _GameSetState();
}

class _GameSetState extends State<GameSet> {
  List _playerOneScore = [0,null];
  List _playerTwoScore = [0,null];
  SetResult result = SetResult(score: [[0,null],[0,null]],isFirstWin: false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            child: Text('Сет ' + widget.setNum.toString(), textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(46, 56, 77, 1),
                fontFamily: 'Inter',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1
            ),)
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text(
                      widget.data.brief1
                  )
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: IntegerExample(
                        max: widget.data.rule.gamesInSets + 1,
                        current: widget.data.rule.gamesInSets,
                        onChangedSelect: (test){
                          _playerOneScore[0] = test;
                          result.score[0] = _playerOneScore;
                          if (_playerOneScore[0] > _playerTwoScore[0]){
                            result.isFirstWin = true;
                          }
                          widget.onChangedSelect(result);
                        },
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:  Color.fromRGBO(239, 243, 245, 1),
                        boxShadow: [
                          BoxShadow(color: Color.fromRGBO(5, 89, 121, 1),),
                        ],
                      ),
                      height: 56,
                      width: 56,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: IntegerExample(
                        max: 99,
                        current: 0,
                        onChangedSelect: (test){
                          _playerOneScore[1] = test;
                          result.score[0] = _playerOneScore;
                          widget.onChangedSelect(result);
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:  Color.fromRGBO(239, 243, 245, 1),
                        boxShadow: [
                          BoxShadow(color: Color.fromRGBO(5, 89, 121, 1),),
                        ],
                      ),
                      alignment: Alignment.center,
                      height: 56,
                      width: 56,
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text(
                      widget.data.brief2
                  )
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: IntegerExample(
                        max: widget.data.rule.gamesInSets + 1,
                        current: 0,
                        onChangedSelect: (test){
                          _playerTwoScore[0] = test;
                          result.score[1] = _playerTwoScore;
                          if (_playerTwoScore[0] > _playerOneScore[0]){
                            result.isFirstWin = false;
                          }
                          widget.onChangedSelect(result);
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:  Color.fromRGBO(239, 243, 245, 1),
                        boxShadow: [
                          BoxShadow(color: Color.fromRGBO(5, 89, 121, 1),),
                        ],
                      ),
                      alignment: Alignment.center,
                      height: 56,
                      width: 56,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: IntegerExample(
                        max: 99,
                        current: 0,
                        onChangedSelect: (test){
                          _playerTwoScore[1] = test;
                          result.score[1] = _playerTwoScore;
                          widget.onChangedSelect(result);
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:  Color.fromRGBO(239, 243, 245, 1),
                        boxShadow: [
                          BoxShadow(color: Color.fromRGBO(5, 89, 121, 1),),
                        ],
                      ),
                      alignment: Alignment.center,
                      height: 56,
                      width: 56,
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ],
    ),
    );
  }
}