import 'package:filme_app/components/bottom_bar.component.dart';
import 'package:filme_app/controllers/bottom_bar.controller.dart';
import 'package:filme_app/tabs/upcoming.tab.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  BottomBarController controller = BottomBarController();

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [UpcomingTab()];
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: tabs[0],
    );
  }
}
