import 'package:flutter/material.dart';

typedef void OnSelect(int i);

class BottomNav extends StatefulWidget {
  final OnSelect onSelect;
  final int selectedIndex;

  BottomNav({this.onSelect, this.selectedIndex});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.075,
      child: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'World',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: widget.onSelect ,
      ),
    );
  }
}
