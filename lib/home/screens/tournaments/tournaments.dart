import 'package:bloc_login/home/screens/clubs/clubs.dart';
import 'package:bloc_login/home/screens/clubs/clubs_page.dart';
import 'package:bloc_login/home/screens/filter/filter_page.dart';
import 'package:bloc_login/repository/tournaments_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_bloc.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_event.dart';
import 'package:bloc_login/bloc/tournaments/tournaments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/model/tournaments.dart';

class TournamentsListScreen extends StatefulWidget {
  @override
  _TournamentsListScreenState createState() => _TournamentsListScreenState();
}

class _TournamentsListScreenState extends State<TournamentsListScreen> {
  TournamentsBloc tournamentsBloc;

  @override
  void initState() {
    super.initState();
    tournamentsBloc = BlocProvider.of<TournamentsBloc>(context);
    tournamentsBloc.add(FetchTournamentsEvent());
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
                child: BlocListener<TournamentsBloc, TournamentsState>(
                  listener: (context, state) {
                    if (state is TournamentsErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<TournamentsBloc, TournamentsState>(
                    builder: (context, state) {
                      if (state is TournamentsInitialState) {
                        return buildLoading();
                      } else if (state is TournamentsLoadingState) {
                        return buildLoading();
                      } else if (state is TournamentsLoadedState) {
                        return buildArticleList(state.tournaments);
                      } else if (state is TournamentsErrorState) {
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

  Widget buildArticleList(List<Tournaments> tournaments) {
    return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 25),
              child: Text('Список турниров', textAlign: TextAlign.left, style: TextStyle(
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
                  itemCount: tournaments.length,
                  itemBuilder: (ctx, pos) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      child: InkWell(
                        child: Container(
                          // alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(tournaments[pos].start, textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(46, 56, 77, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5 /*PERCENT not supported*/
                              ),),
                              Text(tournaments[pos].name, textAlign: TextAlign.left, style: TextStyle(
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
                                    child: Text('Планируется', textAlign: TextAlign.left, style: TextStyle(
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
                          navigateToArticleDetailPage(context, tournaments[pos].id);
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
  // Widget buildArticleList(List<Tournaments> tournaments) {
  //   return ListView.builder(
  //     itemCount: tournaments.length,
  //     itemBuilder: (ctx, pos) {
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: InkWell(
  //           child: ListTile(
  //             leading: ClipOval(
  //               // child: Hero(
  //               // ),
  //             ),
  //             title: Text(tournaments[pos].name),
  //             subtitle: Text(tournaments[pos].start),
  //           ),
  //           onTap: () {
  //             navigateToArticleDetailPage(context, tournaments[pos].id);
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
  void navigateToArticleDetailPage(BuildContext context, int tournament) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FilterScreen(tournament: tournament)),
    );
  }

// void navigateToArticleDetailPage(BuildContext context, Clubs clubs) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return ArticleDetailPage(
//       article: article,
//     );
//   }));
// }
//
// void navigateToAoutPage(BuildContext context) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return AboutPage();
//   }));
// }
}
// class MainScreen56 extends StatelessWidget {
//   const MainScreen56({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(
//         builder: (context) {
//           return Material(
//             child: Scaffold(
//             ...
//             body: Container(
//             child: BlocBuilder<ArticleBloc, ArticleState>(
//             builder: (context, state) {
//           if (state is ArticleInitialState) {
//           return buildLoading();
//           } else if (state is ArticleLoadingState) {
//           return buildLoading();
//           } else if (state is ArticleLoadedState) {
//           return buildArticleList(state.articles);
//           } else if (state is ArticleErrorState) {
//           return buildErrorUi(state.message);
//           }
//           },
//           ),
//           ),
//           ),
//           );
//         },
//       ),
//     );
//   }
// }



// class MainScreen56 extends StatelessWidget {
//   const MainScreen56({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.only(left: 31.0, top: 32.0),
//                         child: Text('Фильтр', textAlign: TextAlign.left, style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Inter',
//                             fontSize: 36,
//                             letterSpacing: 0,
//                             fontWeight: FontWeight.normal,
//                             height: 1.5
//                         ),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(left: 31.0, top: 16.0),
//                         child: Text('Выберите участников', textAlign: TextAlign.left, style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Inter',
//                             fontSize: 15,
//                             letterSpacing: 0,
//                             fontWeight: FontWeight.normal,
//                             height: 1.5
//                         ),
//                         ),
//                       )
//                     ],
//                   ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.only(left: 46.0, top: 18.0, right: 30.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.android),
//                       color: Colors.grey,
//                       onPressed: () {},
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 46.0, top: 18.0, right: 30.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.android),
//                       color: Colors.grey,
//                       onPressed: () {},
//                     ),
//                   ),
//
//                   Container(
//                     margin: const EdgeInsets.only(left: 46.0, top: 18.0, right: 30.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.android),
//                       color: Colors.grey,
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.only(left: 46.0, top: 18.0, right: 30.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.android),
//                       color: Colors.grey,
//                       onPressed: () {},
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 46.0, top: 18.0, right: 30.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.android),
//                       color: Colors.grey,
//                       onPressed: () {},
//                     ),
//                   ),
//
//                   Container(
//                     margin: const EdgeInsets.only(left: 46.0, top: 18.0, right: 30.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.android),
//                       color: Colors.grey,
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//       ),
//     );
//   }
// }


// Figma Flutter Generator Group187Widget - GROUP
