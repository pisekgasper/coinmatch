import 'package:flutter/material.dart';

import '../main.dart';

class CoinmatchFAB extends StatelessWidget {
  static const double kSize = 60;
  final VoidCallback? onTap;
  final Color? background;
  final Widget child;
  final double size;

  const CoinmatchFAB(
      {Key? key,
      this.onTap,
      this.background,
      required this.child,
      this.size = kSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: background,
        child: SizedBox(
          width: size,
          height: size,
          child: InkWell(
            onTap: onTap,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

class CoinmatchLinkButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? background;
  final Widget child;

  const CoinmatchLinkButton(
      {Key? key, this.onTap, this.background, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        type: MaterialType.transparency,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: CoinmatchApp.ff * 17, color: Color(0x99FFFFFF)),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CoinmatchButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const CoinmatchButton({Key? key, this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Theme.of(context).accentColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 48,
            child: DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(fontWeight: FontWeight.w600),
                child: child),
          ),
        ),
      ),
    );
  }
}
