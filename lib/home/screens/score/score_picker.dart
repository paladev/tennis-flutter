import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class IntegerExample extends StatefulWidget {
  final ValueChanged<int> onChangedSelect;
  int max;
  int current;
  IntegerExample({Key key, this.onChangedSelect, this.max,this.current}) : super(key: key);
  @override
  _IntegerExampleState createState() => _IntegerExampleState();
}

class _IntegerExampleState extends State<IntegerExample> {
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
          value: widget.current,
          minValue: 0,
          maxValue: widget.max,
          itemCount: 1,
          onChanged: (num) {
            setState(() {
              widget.current = num;
          });
            widget.onChangedSelect(widget.current);
          });
  }
}