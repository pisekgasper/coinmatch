// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardProvider extends ChangeNotifier {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final FirebaseFirestore db = FirebaseFirestore.instance;

  List<SwipeItem> _swipeItems = [];
  MatchEngine _matchEngine = MatchEngine();
  List<String> _names = ["BTC", "Ethereum", "ADA", "Doge"];
  List<double> _values = [37476.83, 2297.19, 1.47, 0.342014];
  List<String> _image = [
    'https://localbitcoinnow.com/wp-content/uploads/2019/12/The-bit-logo-e1575819611411.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/1200px-Ethereum-icon-purple.svg.png',
    'https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png',
    'https://i.imgflip.com/4w3qc7.png',
  ];
  List<double> _coefMonth = [
    -153.53338640984484,
    9.923764645841054,
    0.009736383965098573,
    0.002042832743445692,
  ];
  List<double> _coefDay = [
    13.691930,
    -0.26005940043407544,
    -0.00016951012615301145,
    0.000008399541169289194,
  ];

  List<double> _volume = [
    53898.025708108995,
    989766.6026248597,
    204040441.54399386,
    131819419.80282837,
  ];

  CardProvider() {
    for (int i = 0; i < _names.length; i++) {
      this._swipeItems.add(
            SwipeItem(
              content: Content(
                name: _names[i],
                img: _image[i],
                value: _values[i],
                volume: _volume[i],
                daily_trend: _coefDay[i],
                monthly_trend: _coefMonth[i],
              ),
            ),
          );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  MatchEngine get matchEngine => _matchEngine;
  List<SwipeItem> get swipeItems => _swipeItems;
}

class Content {
  final String name;
  final String img;
  final double value;
  final double volume;
  final double daily_trend;
  final double monthly_trend;

  const Content(
      {required this.name,
      required this.img,
      required this.value,
      required this.volume,
      required this.daily_trend,
      required this.monthly_trend});
}
