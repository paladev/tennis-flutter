import 'package:flutter/material.dart';
import 'custom-widget-tabs.widget.dart';
import 'screens.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first': (context) => MainScreen2(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => MainScreen3(),
      },
    );
  }
}

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              child: Text("Built-in styles example"),
              onPressed: () => pushNewScreen(
                context,
                screen: ProvidedStylesExample(
                  menuScreenContext: context,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home | Home Hub'),
//       ),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(padding: EdgeInsets.only(left: 30.0),
//             child: Text(
//               'Welcome',
//               style: TextStyle(
//                 fontSize: 24.0,
//               ),
//             ),),
//             Padding(
//               padding: EdgeInsets.fromLTRB(34.0, 20.0, 0.0, 0.0),
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 height: MediaQuery.of(context).size.width * 0.16,
//                 child: RaisedButton(
//                   child: Text(
//                     'Logout',
//                     style: TextStyle(
//                       fontSize: 24,
//                     ),
//                   ),
//                   onPressed: () {
//                     BlocProvider.of<AuthenticationBloc>(context)
//                         .add(LoggedOut());
//                   },
//                   shape: StadiumBorder(
//                     side: BorderSide(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
