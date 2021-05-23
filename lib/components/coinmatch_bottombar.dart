import 'package:flutter/material.dart';
import 'package:coinmatch/globals.dart';
import 'package:coinmatch/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CoinmatchBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<HomeProvider>();

    return Material(
      color: Pallette.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CoinmatchTab(
              label: "Leaderboard",
              color: Pallette.background,
              iconData: Icons.leaderboard_outlined,
              selected: tabProvider.currentTab == HomeTab.leaderboard,
              onTap: () => tabProvider.setTab(HomeTab.leaderboard),
            ),
            CoinmatchTab(
              label: "CoinSwipe",
              color: Pallette.background,
              iconData: Icons.show_chart_rounded,
              selected: tabProvider.currentTab == HomeTab.coinSwipe,
              onTap: () => tabProvider.setTab(HomeTab.coinSwipe),
            ),
            CoinmatchTab(
              label: "Favorites",
              color: Pallette.background,
              iconData: Icons.star_outline_rounded,
              selected: tabProvider.currentTab == HomeTab.favorites,
              onTap: () => tabProvider.setTab(HomeTab.favorites),
            ),
          ],
        ),
      ),
    );
  }
}

class CoinmatchTab extends StatelessWidget {
  final String semanticLabel;
  final String label;
  final IconData iconData;
  final Color color;
  final bool selected;
  final VoidCallback? onTap;

  const CoinmatchTab({
    Key? key,
    this.semanticLabel = "",
    required this.label,
    required this.iconData,
    required this.color,
    required this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            width: 1.5,
            color: selected ? Colors.transparent : Pallette.accent,
          ),
          color: selected ? Pallette.accent : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: selected ? 8.0 : 0.0,
                ),
                child: Icon(
                  iconData,
                  color: selected ? color : Pallette.content,
                  size: 28.0,
                  semanticLabel: semanticLabel,
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: selected ? 15 : 0,
                  height: 1.2,
                  letterSpacing: -0.24,
                  color: selected ? color : Pallette.content,
                ),
                child: Text(
                  label,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
