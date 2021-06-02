import 'package:flutter/material.dart';
import 'package:customtogglebuttons/customtogglebuttons.dart';
class ToggleButtonsExample extends StatefulWidget {
  final ValueChanged<int> onChangedSelect;
  ToggleButtonsExample({Key key, this.onChangedSelect}) : super(key: key);

  @override
  ToggleButtonsExampleState createState() => new ToggleButtonsExampleState();

}


class ToggleButtonsExampleState extends State<ToggleButtonsExample> {

  int choice;
  List<bool> _isSelected = [false,false,false];
  List<bool> _flagGroup = [true, true, true, true,true,true];
  List<Color> secondGroup = [Colors.red,Colors.red,Colors.red];
  // List<bool> secondGroup = [false,false,false];
  bool _flag = true;
  @override

  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          for( var i = 0 ; i < _flagGroup.length; i++ ) {
                            _flagGroup[i] = true;
                          }
                          widget.onChangedSelect(1);
                          setState(() => _flagGroup[0] = !_flagGroup[0]);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(20),primary: _flagGroup[0] ? Color(0xEFF3F5) : Colors.teal,),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text('Мужчины', textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                        ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          for( var i = 0 ; i < _flagGroup.length; i++ ) {
                            _flagGroup[i] = true;
                          }
                          widget.onChangedSelect(3);
                          setState(() => _flagGroup[1] = !_flagGroup[1]);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(20),primary: _flagGroup[1] ? Color(0xEFF3F5) : Colors.teal,),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text('Пары мужчины', textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                        ),),
                      ),

                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          for( var i = 0 ; i < _flagGroup.length; i++ ) {
                            _flagGroup[i] = true;
                          }
                          widget.onChangedSelect(5);
                          setState(() => _flagGroup[2] = !_flagGroup[2]);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(20),primary: _flagGroup[2] ? Color(0xEFF3F5) : Colors.teal,),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text('Микс', textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          for( var i = 0 ; i < _flagGroup.length; i++ ) {
                            _flagGroup[i] = true;
                          }
                          widget.onChangedSelect(2);
                          setState(() => _flagGroup[3] = !_flagGroup[3]);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(20),primary: _flagGroup[3] ? Color(0xEFF3F5) : Colors.teal,),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text('Женщины', textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                        ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          for( var i = 0 ; i < _flagGroup.length; i++ ) {
                            _flagGroup[i] = true;
                          }
                          widget.onChangedSelect(4);
                          setState(() => _flagGroup[4] = !_flagGroup[4]);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(20),primary: _flagGroup[4] ? Color(0xEFF3F5) : Colors.teal,),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text('Пары женщины', textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                        ),),
                      ),

                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          for( var i = 0 ; i < _flagGroup.length; i++ ) {
                            _flagGroup[i] = true;
                          }
                          widget.onChangedSelect(0);
                          setState(() => _flagGroup[5] = !_flagGroup[5]);
                        },
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(20),primary: _flagGroup[5] ? Color(0xEFF3F5) : Colors.teal,),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text('Команды', textAlign: TextAlign.left, style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                        ),),
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