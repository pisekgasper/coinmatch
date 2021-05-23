import 'package:coinmatch/globals.dart';
import 'package:flutter/material.dart';
import 'package:coinmatch/providers/card_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesPage extends StatelessWidget {
  String urlBTC = "https://www.binance.com/en/trade/BTC_USDT?type=spot";
  String urlETH = "https://www.binance.com/en/trade/ETH_USDT?type=spot";
  String urlADA = "https://www.binance.com/en/trade/ADA_USDT?type=spot";
  String urlDOGE = "https://www.binance.com/en/trade/DOGE_USDT?type=spot";

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
                    child: InkWell(
                      onTap: () {},
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
                ),
              )
          ],
        ),
      ),
    );
  }

  // _launchURL(String x) async {
  //   String url = 'https://www.binance.com/en/trade/${x}_USDT?type=spot';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
