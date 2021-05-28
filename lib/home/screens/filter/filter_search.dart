import 'package:bloc_login/home/screens/filter/filter_old.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FormExample extends StatefulWidget {
  List<FilterPlayers> players;
  FormExample({this.players});

  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text('What is your favorite city?'),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'City'),
                controller: this._typeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return CitiesService.getSuggestions(pattern);
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
              },
              validator: (value) =>
              value.isEmpty ? 'Please select a city' : null,
              onSaved: (value) => this._selectedCity = value,
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                if (this._formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content:
                      Text('Your Favorite City is ${this._selectedCity}'),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}