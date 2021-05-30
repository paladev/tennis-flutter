
import 'package:bloc_login/home/custom-widget-tabs.widget.dart';
import 'package:bloc_login/home/home.dart';
import 'package:bloc_login/home/screens.dart';
import 'package:bloc_login/home/screens/clubs/clubs_page.dart';
import 'package:bloc_login/home/screens/filter/filter_buttons.dart';
import 'package:bloc_login/home/screens/filter/filter_first.dart';
import 'package:bloc_login/home/screens/filter/filter_second.dart';
import 'package:bloc_login/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:bloc_login/bloc/filter/filter_bloc.dart';
import 'package:bloc_login/bloc/filter/filter_event.dart';
import 'package:bloc_login/bloc/filter/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/model/filter.dart';
import 'package:bloc_login/home/screens/filter/filter_page.dart';
import 'package:bloc_login/home/routes.dart';
import 'package:bloc_login/repository/filter_repository.dart';
import 'package:bloc_login/login/login_page.dart';


class FilterPlayersScreen extends StatefulWidget {
  @override
  _FilterPlayersScreenState createState() => _FilterPlayersScreenState();
}

class _FilterPlayersScreenState extends State<FilterPlayersScreen> {
  FilterBloc filterBloc;
  String _type;
  String _playerOne;
  String _playerTwo;
  List<IconData> imagePath = [
    Icons.bluetooth,
    Icons.wifi,
    Icons.flash_on,
    Icons.flash_on,
    Icons.flash_on,
    Icons.flash_on
  ];
  @override
  void initState() {
    super.initState();
    filterBloc = BlocProvider.of<FilterBloc>(context);
    filterBloc.add(FetchFilterEvent());
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Фильтр', style: TextStyle(
                    color: Colors.black
                ),),
                backgroundColor: Colors.white,
                leading: IconButton(icon:Icon(Icons.chevron_left, color: Colors.black,),onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
                ),),
              ),

              // appBar: AppBar(
              //   title: Text("Cricket"),
              //   actions: <Widget>[
              //     IconButton(
              //       icon: Icon(Icons.refresh),
              //       onPressed: () {
              //         clubsBloc.add(FetchClubsEvent());
              //       },
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.info),
              //       onPressed: () {
              //       },
              //     )
              //   ],
              // ),
              body: Container(
                child: BlocListener<FilterBloc, FilterState>(
                  listener: (context, state) {
                    if (state is FilterErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, state) {
                      if (state is FilterInitialState) {
                        return buildLoading();
                      } else if (state is FilterLoadingState) {
                        return buildLoading();
                      } else if (state is FilterLoadedState) {
                        return buildArticleList(state.filter);
                      } else if (state is FilterErrorState) {
                        return buildErrorUi(state.message);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<FilterPlayers> players) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Фильтр', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(46, 56, 77, 1),
                      fontFamily: 'Inter',
                      fontSize: 36,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      height: 1.5 /*PERCENT not supported*/
                  ),),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Выберите первого участника', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(46, 56, 77, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                  ),),
                ),
              ),

              Container( child: ToggleButtonsExample(
              ),),

              FilterFirst(
              players: players,
              onChangedSelect: (player){
                _playerOne = player;

              }),
              FilterSecond(
                  players: players,
                  onChangedSelect: (player){
                    _playerTwo = player;
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: SizedBox(
                    width:double.infinity - 20.0,//width of button equal to parent widget
                    height: 50,
                    child:ElevatedButton(
                      child: Text('Поиск'),
                      onPressed: () {
                        print(_playerOne);
                        print(_playerTwo);
                      },
                    )),
              ),



            ],

          )
    );


  }

  // Widget AutocompleteBasicUserExample(List<FilterPlayers> players) {
  //   return Autocomplete<FilterPlayers>(
  //     displayStringForOption: (FilterPlayers option) => option.name,
  //     optionsBuilder: (TextEditingValue textEditingValue) {
  //       if (textEditingValue.text == '') {
  //         return const Iterable<FilterPlayers>.empty();
  //       }
  //       return players.where((FilterPlayers option) {
  //         return option.toString().contains(textEditingValue.text.toLowerCase());
  //       });
  //     },
  //     // onSelected: (FilterPlayers selection) {
  //     //   print('You just selected ${_displayStringForOption(selection)}');
  //     // },
  //   );
  // }
}
// void navigateToArticleDetailPage(BuildContext context, int club) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => TournamentsScreen(club: club)),
//   );