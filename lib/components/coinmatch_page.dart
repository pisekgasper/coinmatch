import 'package:flutter/material.dart';
import 'coinmatch_appbar.dart';
import 'coinmatch_bottombar.dart';

class CoinmatchPage extends StatelessWidget {
  final CoinmatchAppbar? appbar;
  final CoinmatchBottomBar? bottomBar;
  final Widget child;
  final Color? background;

  const CoinmatchPage(
      {Key? key,
      required this.child,
      this.appbar,
      this.bottomBar,
      this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (appbar != null) {
      body = Stack(
        children: [
          Positioned.fill(
            top: appbar!.height + MediaQuery.of(context).padding.top,
            child: child,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: appbar!.height + MediaQuery.of(context).padding.top,
            child: appbar!,
          ),
        ],
      );
    } else {
      body = SafeArea(child: child);
    }

    return Scaffold(
      body: body,
      backgroundColor: background,
    );
  }
}
