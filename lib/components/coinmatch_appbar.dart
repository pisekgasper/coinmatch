import 'dart:io';
import 'package:coinmatch/globals.dart';
import 'package:flutter/material.dart';

class CoinmatchAppbar extends StatelessWidget {
  static const kHeight = 75.0;
  final List<Widget> children;
  final String? title;
  final Color? color;
  final double height;

  const CoinmatchAppbar({
    Key? key,
    this.children = const [],
    this.title,
    this.color,
    this.height = kHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Align(
        alignment: Alignment.center,
        child: Text(
          title ?? "",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(40.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: Colors.transparent,
                ),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.settings_rounded,
                  color: Pallette.content,
                  size: 28.0,
                  semanticLabel: "Settings",
                ),
              ),
            ),
          ),
        ),
      )
    ];

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
