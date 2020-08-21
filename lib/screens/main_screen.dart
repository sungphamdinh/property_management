import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_management/screens/home/home_screen.dart';

enum Tabs { ExploreTab, RoommateTab, MessagesTab, AccountTab }

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              title: Text("Explore"), icon: Icon(Icons.open_with)),
          BottomNavigationBarItem(
              title: Text("Roommate"), icon: Icon(Icons.people)),
          BottomNavigationBarItem(
              title: Text("Messages"), icon: Icon(Icons.message)),
          BottomNavigationBarItem(
              title: Text("Account"), icon: Icon(Icons.account_box))
        ],
      ),
      tabBuilder: (ctx, tabIndex) {
        final newTab = Tabs.values[tabIndex];
        switch (newTab) {
          case Tabs.ExploreTab:
            return HomeScreen();
          case Tabs.RoommateTab:
            return comingSoonPage();
          case Tabs.MessagesTab:
            return comingSoonPage();
          default:
            return comingSoonPage();
        }
      },
    );
  }

  Widget comingSoonPage() {
    return Scaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
