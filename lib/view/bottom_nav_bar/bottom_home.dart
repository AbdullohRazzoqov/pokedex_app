import 'package:flutter/material.dart';
import 'package:pokedexapp/view/bottom_nav_bar/bottom_page/album_bottom_page.dart';
import 'package:pokedexapp/view/bottom_nav_bar/bottom_page/home_bottom_page.dart';
import 'package:pokedexapp/view/bottom_nav_bar/bottom_page/search_bottom_page.dart';

class MyBottomNavBarHome extends StatefulWidget {
  const MyBottomNavBarHome({super.key});

  @override
  State<MyBottomNavBarHome> createState() => _MyBottomNavBarHomeState();
}

class _MyBottomNavBarHomeState extends State<MyBottomNavBarHome> {
  int _selectedIndex = 1;
  static const List<Widget> _myPage = <Widget>[
    AlbumBottomPage(),
    HomeBottomPage(),
    SearchBottomPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _myPage.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            label: "Album",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
