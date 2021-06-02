import 'package:bloc_login/home/screens/filter/filter_func.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class FilterFirst extends StatefulWidget {
  List<FilterPlayers> players;
  final ValueChanged<FilterPlayers> onChangedSelect;
  FilterFirst({Key key,this.players, this.onChangedSelect}) : super(key: key);
  @override
  _FilterFirstState createState() => _FilterFirstState();
}

class _FilterFirstState extends State<FilterFirst> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.only(top:35.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'Первый участник', border: OutlineInputBorder()),
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
            ),
          ],
        ),
      ),
    );
  }
}