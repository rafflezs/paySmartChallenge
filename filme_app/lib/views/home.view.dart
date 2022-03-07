import 'package:filme_app/components/bottom_bar.component.dart';
import 'package:filme_app/tabs/upcoming.tab.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [UpcomingTab()];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
