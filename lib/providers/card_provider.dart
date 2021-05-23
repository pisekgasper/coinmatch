import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardProvider extends ChangeNotifier {
  List<SwipeItem> _swipeItems = [];
  MatchEngine _matchEngine = MatchEngine();
  List<String> _names = ["BTC", "Ethereum", "ADA", "Doge"];
  List<double> _values = [50000.99, 2576.32, 1.30, 0.51];
  List<String> _image = [
    'https://localbitcoinnow.com/wp-content/uploads/2019/12/The-bit-logo-e1575819611411.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/1200px-Ethereum-icon-purple.svg.png',
    'https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png',
    'https://i.imgflip.com/4w3qc7.png',
  ];

  CardProvider() {
    for (int i = 0; i < _names.length; i++) {
      this._swipeItems.add(
            SwipeItem(
              content: Content(
                name: _names[i],
                img: _image[i],
                value: _values[i],
              ),
            ),
          );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  MatchEngine get matchEngine => _matchEngine;
  List<SwipeItem> get swipeItems => _swipeItems;

  // void setTab() {
  //   currentTab = tab;
  //   notifyListeners();
  // }
}

class Content {
  final String name;
  final String img;
  final double value;

  const Content({required this.name, required this.img, required this.value});
}
