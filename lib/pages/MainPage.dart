import 'package:flutter/material.dart';
import 'package:zarity/components/drawerIcon.dart';
import 'package:zarity/tabs/HomeTab.dart';

import '../widgets/Mydrawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
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
      key: _scaffoldKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: DrawerIcon(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Stack(children: [
              Container(
                width: 38,
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                ),
              ),
              Positioned(
                  bottom: 2.5,
                  left: 23,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x770500F3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.7),
                      child: Text(
                        "6",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
            ]),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff0500F3),
        onTap: _onItemTapped,
      ),
    );
  }
}
