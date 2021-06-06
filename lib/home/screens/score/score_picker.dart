import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class IntegerExample extends StatefulWidget {
  @override
  _IntegerExampleState createState() => _IntegerExampleState();
}

class _IntegerExampleState extends State<IntegerExample> {
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 100,
          itemCount: 1,
          onChanged: (value) => setState(() => _currentValue = value),
        );
  }
}