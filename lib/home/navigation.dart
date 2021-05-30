import 'package:bloc_login/home/screens/clubs/clubs_page.dart';
import 'package:flutter/material.dart';

class PreservingBottomNavState extends StatefulWidget {
  const PreservingBottomNavState({Key key}) : super(key: key);

  @override
  _PreservingBottomNavStateState createState() =>
      _PreservingBottomNavStateState();
}

class _PreservingBottomNavStateState extends State<PreservingBottomNavState> {
  int _selectedIndex = 0;

  static  List<Widget> _pages = <Widget>[
    Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),

    ClubsScreen(),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Color(0xFFEFF3F5), spreadRadius: 0, blurRadius: 0),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xFFEFF3F5),
                unselectedItemColor: Color(0xFF8798AD),
                selectedItemColor: Color(0xFF055979),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.call),
                      title: Text('Personal')
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.camera),
                      title: Text('Personal')
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.camera),
                      title: Text('Personal')

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.camera),
                      title: Text('Personal')
                  ),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      title: Text('Personal')
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            )


          )










    );
  }
}
