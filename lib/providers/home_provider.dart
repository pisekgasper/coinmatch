import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeTab currentTab = HomeTab.coinSwipe;

  void setTab(HomeTab tab) {
    currentTab = tab;
    notifyListeners();
  }
}

enum HomeTab { user, coinSwipe, leaderboard, favorites }
