import 'package:coinmatch/coinswipe.dart';
import 'package:coinmatch/components/coinmatch_appbar.dart';
import 'package:coinmatch/components/coinmatch_bottombar.dart';
import 'package:coinmatch/components/coinmatch_page.dart';
import 'package:coinmatch/globals.dart';
import 'package:coinmatch/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'leaderboard.dart';
import 'favorites.dart';

class CoinmatchHomePage extends StatefulWidget {
  @override
  _CoinmatchHomePageState createState() => _CoinmatchHomePageState();
}

class _CoinmatchHomePageState extends State<CoinmatchHomePage> {
  Widget? _currentTabContent;

  @override
  void initState() {
    _currentTabContent = CoinSwipePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    if (homeProvider.currentTab == HomeTab.coinSwipe)
      _currentTabContent = CoinSwipePage();
    else if (homeProvider.currentTab == HomeTab.leaderboard)
      _currentTabContent = LeaderboardPage();
    else if (homeProvider.currentTab == HomeTab.favorites)
      _currentTabContent = FavoritesPage();

    return CoinmatchPage(
      appbar: CoinmatchAppbar(
        title: homeProvider.title,
      ),
      bottomBar: CoinmatchBottomBar(),
      background: Pallette.background,
      child: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(
                milliseconds: 300,
              ),
              child: _currentTabContent ?? Offstage(),
            ),
          ),
          CoinmatchBottomBar(),
        ],
      ),
    );
  }
}
