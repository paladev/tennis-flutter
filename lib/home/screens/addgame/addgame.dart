import 'package:bloc_login/repository/clubs_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc_login/bloc/clubs/clubs_bloc.dart';
import 'package:bloc_login/bloc/clubs/clubs_event.dart';
import 'package:bloc_login/bloc/clubs/clubs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/model/tournament_model.dart';

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
              appBar: AppBar(title: const Text('Counter')),
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
    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: ClipOval(
                // child: Hero(
                // ),
              ),
              title: Text(clubs[pos].name),
              subtitle: Text(clubs[pos].role),
            ),
            onTap: () {
            },
          ),
        );
      },
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
