import 'package:coinmatch/globals.dart';
import 'package:coinmatch/providers/card_provider.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:swipe_cards/swipe_cards.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';

class CoinSwipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final cardProvider = context.watch<CardProvider>();
    List<SwipeItem> _swipeItems = cardProvider.swipeItems;

    return _swipeItems.isEmpty
        ? Container(
            child: Center(
              child: Text(
                "No coins left!",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          )
        : Container(
            alignment: Alignment.topCenter,
            child: Expanded(
              child: Container(
                height: height * 0.55,
                width: width * 0.90,
                child: SwipeCards(
                  matchEngine: cardProvider.matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Pallette.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          CryptoLogo(
                            urlString: _swipeItems[index].content.img,
                          ),
                          CryptoTitle(
                            titleString: _swipeItems[index].content.name,
                          ),
                          CryptoValue(
                            value: _swipeItems[index].content.value,
                          )
                        ],
                      ),
                    );
                  },
                  onStackFinished: () {
                    _swipeItems.clear();
                  },
                ),
              ),
            ),
          );
  }
}

class CryptoLogo extends StatelessWidget {
  final String urlString;

  const CryptoLogo({Key? key, required this.urlString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          urlString,
          height: MediaQuery.of(context).size.height / 6,
        )
      ],
    );
  }
}

class CryptoTitle extends StatelessWidget {
  final String titleString;

  const CryptoTitle({Key? key, required this.titleString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(titleString),
      ],
    );
  }
}

class CryptoValue extends StatelessWidget {
  final double value;

  const CryptoValue({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(value.toString()),
      ],
    );
  }
}
