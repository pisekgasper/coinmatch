import 'dart:io';
import 'package:flutter/material.dart';
import './coinmatch_buttons.dart';

typedef CoinmatchAppbarAnimatedBuilder = Widget Function(
    BuildContext context, double progress);

class CoinmatchAppbarAnimatedHeader {
  final CoinmatchAppbarAnimatedBuilder builder;
  final double expandedHeight;
  final ValueNotifier<double> scrollOffset;

  CoinmatchAppbarAnimatedHeader(
      {required this.builder,
      required this.expandedHeight,
      required this.scrollOffset});
}

class CoinmatchAppbar extends StatelessWidget {
  static const kHeight = 75.0;
  final List<Widget> children;
  final Widget? leading;
  final Color? color;
  final double height;
  final CoinmatchAppbarAnimatedHeader? animatedHeader;

  const CoinmatchAppbar(
      {Key? key,
      this.leading,
      this.children = const [],
      this.color,
      this.height = kHeight,
      this.animatedHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (animatedHeader != null) {
      children.add(
        AnimatedBuilder(
          animation: animatedHeader!.scrollOffset,
          builder: (context, child) {
            final progress = 1 -
                (animatedHeader!.scrollOffset.value /
                        animatedHeader!.expandedHeight)
                    .clamp(0.0, 1.0);
            return Positioned(
              top: 0,
              bottom: -progress * animatedHeader!.expandedHeight,
              left: 0,
              right: 0,
              child: Container(
                  color: color,
                  child: animatedHeader!.builder(context, progress)),
            );
          },
        ),
      );
    }

    List<Widget> fixedChildren = [];
    if (leading != null) fixedChildren.add(leading!);
    fixedChildren.addAll(this.children);
    children.add(
      Positioned.fill(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: fixedChildren,
        ),
      ),
    );

    return Container(
      color: color ?? Colors.transparent,
      child: SafeArea(
        child: SizedBox(
          height: height,
          child: Stack(
            clipBehavior: Clip.none,
            children: children,
          ),
        ),
      ),
    );
  }
}

class TealBack extends StatelessWidget {
  final VoidCallback? onTap;

  const TealBack({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoinmatchLinkButton(
      onTap: onTap!,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              'Back',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Theme.of(context).accentColor),
            )
          ],
        ),
      ),
    );
  }
}
