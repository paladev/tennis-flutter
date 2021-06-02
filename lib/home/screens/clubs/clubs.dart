
import 'package:bloc_login/home/custom-widget-tabs.widget.dart';
import 'package:bloc_login/home/home.dart';
import 'package:bloc_login/home/navigation.dart';
import 'package:bloc_login/home/screens.dart';
import 'package:bloc_login/home/screens/clubs/clubs_page.dart';
import 'package:bloc_login/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:bloc_login/bloc/clubs/clubs_bloc.dart';
import 'package:bloc_login/bloc/clubs/clubs_event.dart';
import 'package:bloc_login/bloc/clubs/clubs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/model/clubs.dart';
import 'package:bloc_login/home/screens/tournaments/tournaments_page.dart';
import 'package:bloc_login/home/routes.dart';
import 'package:bloc_login/repository/user_repository.dart';
import 'package:bloc_login/login/login_page.dart';


class ClubsListScreen extends StatefulWidget {
  @override
  _ClubsListScreenState createState() => _ClubsListScreenState();
}

class _ClubsListScreenState extends State<ClubsListScreen> {
  ClubsBloc clubsBloc;

  @override
  void initState() {
    super.initState();
    clubsBloc = BlocProvider.of<ClubsBloc>(context);
    clubsBloc.add(FetchClubsEvent());
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Cписок клубов', style: TextStyle(
                    color: Colors.black
                ),),
                backgroundColor: Colors.white,
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
                child: BlocListener<ClubsBloc, ClubsState>(
                  listener: (context, state) {
                    if (state is ClubsErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<ClubsBloc, ClubsState>(
                    builder: (context, state) {
                      if (state is ClubsInitialState) {
                        return buildLoading();
                      } else if (state is ClubsLoadingState) {
                        return buildLoading();
                      } else if (state is ClubsLoadedState) {
                        return buildArticleList(state.clubs);
                      } else if (state is ClubsErrorState) {
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

  Widget buildArticleList(List<Clubs> clubs) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 25),
            child: Text('Список клубов', textAlign: TextAlign.left, style: TextStyle(
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
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: clubs.length,
                itemBuilder: (ctx, pos) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                    child: InkWell(
                      child: Container(
                        // alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(clubs[pos].name, textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(46, 56, 77, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 31.0),
                            ),
                            Text('ФОК УлГУ, Ульяновск', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(46, 56, 77, 1),
                                fontFamily: 'Inter',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                            ),),
                            Row(
                              children: [
                                Text('Статус ', textAlign: TextAlign.left, style: TextStyle(
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
                                    child: Text('Основной', textAlign: TextAlign.left, style: TextStyle(
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
                          ],
                        ),
                      ),
                      onTap: () {
                        navigateToArticleDetailPage(context, clubs[pos].id);
                      },
                    ),
                  );
                },
              ),),
          ),
        ),
      ],
    );


  }
}
void navigateToArticleDetailPage(BuildContext context, int club) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TournamentsScreen(club: club)),
  );
}