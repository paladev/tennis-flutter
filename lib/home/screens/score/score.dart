import 'package:bloc_login/home/screens/clubs/clubs.dart';
import 'package:bloc_login/home/screens/clubs/clubs_page.dart';
import 'package:bloc_login/home/screens/filter/filter_page.dart';
import 'package:bloc_login/model/score_model.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc_login/bloc/score/score_bloc.dart';
import 'package:bloc_login/bloc/score/score_event.dart';
import 'package:bloc_login/bloc/score/score_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/model/tournaments.dart';

class ScoreListScreen extends StatefulWidget {
  @override
  _ScoreListScreenState createState() => _ScoreListScreenState();
}

class _ScoreListScreenState extends State<ScoreListScreen> {
  ScoreBloc scoreBloc;

  @override
  void initState() {
    super.initState();
    scoreBloc = BlocProvider.of<ScoreBloc>(context);
    scoreBloc.add(FetchScoreEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Список турниров', style: TextStyle(
                    color: Colors.black
                ),),
                backgroundColor: Colors.white,
                leading: IconButton(icon:Icon(Icons.chevron_left, color: Colors.black,),onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ClubsScreen();
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
                child: BlocListener<ScoreBloc, ScoreState>(
                  listener: (context, state) {
                    if (state is ScoreErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<ScoreBloc, ScoreState>(
                    builder: (context, state) {
                      if (state is ScoreInitialState) {
                        return buildLoading();
                      } else if (state is ScoreLoadingState) {
                        return buildLoading();
                      } else if (state is ScoreLoadedState) {
                        return buildArticleList(context, state.score);
                      } else if (state is ScoreErrorState) {
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

  Widget buildArticleList(BuildContext context, ScoreRoundFull score) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 25),
            child: Text(
              'Игра', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(46, 56, 77, 1),
                fontFamily: 'Inter',
                fontSize: 36,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
                height: 1.5 /*PERCENT not supported*/
            ),),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 0),
            child: Container(// alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              score.tournament.startDate + "---" + score.tournament.endDate, textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 56, 77, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                              ),),
                            Text(
                              score.tournament.name, textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 56, 77, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 31.0),
                            // ),
                            Text(
                              'ФОК УлГУ, Ульяновск', textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 56, 77, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                              ),),
                            Row(
                              children: [
                                Text('Статус ', textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5 /*PERCENT not supported*/
                                  ),),
                                Container(
                                  height: 20,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   color: Color.fromRGBO(5, 89, 121, 0.1),
                                    // ),
                                    color: Color.fromRGBO(5, 89, 121, 0.1),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Планируется', textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xFF055979),
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                      ),),
                                  ),
                                ),

                              ],
                            ),

                            Divider(
                                color: Color.fromRGBO(239, 243, 245, 1),
                                thickness: 2
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                              ),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),

                              ),
                            ),
                            Divider(
                                color: Color.fromRGBO(239, 243, 245, 1),
                                thickness: 2
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('Раунд 1', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Text('2', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('6', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('7', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('10', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                  Container(
                                      child: Text('+', textAlign: TextAlign.right, style: TextStyle(
                                          color: Color.fromRGBO(46, 56, 77, 1),
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),
                                ],
                              ),

                            ),
                            Container(
                                child: Text('Сет 1', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(46, 56, 77, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ],
                        ),
                      ),
                    ),
                          ),
    ],
    );
  }
  }
  void navigateToArticleDetailPage(BuildContext context, int tournament) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FilterScreen(tournament: tournament)),
    );
  }

