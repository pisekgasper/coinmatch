import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeTab currentTab = HomeTab.coinSwipe;
  String title = "CoinSwipe";

  void setTab(HomeTab tab) {
    currentTab = tab;
    switch (currentTab) {
      case HomeTab.coinSwipe:
        title = "CoinSwipe";
        break;
      case HomeTab.favorites:
        title = "Favorites";
        break;
      case HomeTab.leaderboard:
        title = "Leaderboard";
        break;
    }
    notifyListeners();
  }
}

enum HomeTab { coinSwipe, leaderboard, favorites }
