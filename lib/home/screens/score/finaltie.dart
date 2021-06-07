import 'package:bloc_login/home/screens/score/score_picker.dart';
import 'package:bloc_login/home/screens/score/setResult.dart';
import 'package:bloc_login/model/score_model.dart';
import 'package:flutter/material.dart';

class FinalTie extends StatefulWidget{

  final Stream<bool> stream;
  final ValueChanged<SetResult> onChangedSelect;
  ScoreRoundFull data;
  FinalTie({this.stream,this.data,this.onChangedSelect});

  @override
  _FinalTieState createState() => _FinalTieState();
}

class _FinalTieState extends State<FinalTie> {

  List _playerOneScore = [null,0];
  List _playerTwoScore = [null,0];
  SetResult result = SetResult(score: [[null,0],[null,0]],isFirstWin: false);

  bool isVisible = false;
  void _updateVisible(bool newState) {
    setState(() {
      isVisible = newState;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.stream.listen((visible) {
      _updateVisible(visible);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                child: Text('Решающий тай-брейк', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(46, 56, 77, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Text(
                        widget.data.brief1
                    )
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
                  height: 56,
                  width: 56,
                ),

              ],
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
                  height: 56,
                  width: 56,
                ),

              ],
            ),
            ),
          ],
        ),
      ),

    );
  }
}