import 'package:flutter/material.dart';
import 'package:filme_app/controllers/bottom_bar.controller.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomBarController _controller = BottomBarController();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _controller.currentIndex,
      onTap: updateIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourites")
      ],
    );
  }

  ValueChanged<int>? updateIndex(int index) {
    setState(() {
      _controller.currentIndex = index;
    });
  }
}
