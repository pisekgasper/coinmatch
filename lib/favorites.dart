import 'package:coinmatch/globals.dart';
import 'package:flutter/material.dart';
import 'package:coinmatch/providers/card_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<CardProvider>();
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: ListView(
          children: [
            for (Content c in favoritesProvider.favorites)
              Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) => favoritesProvider.dismiss(c),
                  child: Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Pallette.primary.shade800,
                      ),
                      height: 100.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Image.network(
                                c.img,
                                height: 50.0,
                              ),
                            ),
                            Text(
                              c.name,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
