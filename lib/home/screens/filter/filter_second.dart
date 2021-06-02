import 'package:bloc_login/home/screens/filter/filter_func.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FilterSecond extends StatefulWidget {
  List<FilterPlayers> players;
  final ValueChanged<FilterPlayers> onChangedSelect;
  FilterSecond({Key key,this.players, this.onChangedSelect}) : super(key: key);
  @override
  _FilterSecondState createState() => _FilterSecondState();
}

class _FilterSecondState extends State<FilterSecond> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'Второй участник', border: OutlineInputBorder()),
                controller: this._typeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return FilterPlayer.getSuggestions(widget.players, pattern);
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (String suggestion) {
                this._typeAheadController.text = suggestion;
                widget.onChangedSelect(FilterPlayer.getSuggestionsId(widget.players, suggestion));
              },
              // onChanged: (value) => widget.player(value),
              // validator: (value) =>
              // value.isEmpty ? 'Please select a city' : null,
              // onSaved: (value) => widget.player(value),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            // RaisedButton(
            //   child: Text('Submit'),
            //   onPressed: () {
            //     if (this._formKey.currentState.validate()) {
            //       this._formKey.currentState.save();
            //       Scaffold.of(context).showSnackBar(
            //         SnackBar(
            //           content:
            //           Text('Your Favorite City is ${this._selectedCity}'),
            //         ),
            //       );
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}