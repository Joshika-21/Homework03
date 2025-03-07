import 'package:flutter/material.dart';
import 'dart:math';

import '../models/card_model.dart';

class GameProvider with ChangeNotifier {
  List<CardModel> _cards = [];

  List<CardModel> get cards => _cards;

  GameProvider() {
    _initializeCards();
  }

  void _initializeCards() {
    // Large list of emojis to choose from
    List<String> allEmojis = [
      "🍎",
      "🍌",
      "🍒",
      "🍇",
      "🍉",
      "🍍",
      "🥝",
      "🍑",
      "🍋",
      "🍊",
      "🍈",
      "🍓",
      "🥭",
      "🥥",
      "🫐",
      "🍏",
    ];

    allEmojis.shuffle(); // Shuffle emojis
    List<String> selectedEmojis =
        allEmojis.take(8).toList(); // Pick 8 unique emojis
    List<String> gameEmojis = [...selectedEmojis, ...selectedEmojis]
      ..shuffle(); // Duplicate & shuffle

    _cards = List.generate(gameEmojis.length, (index) {
      return CardModel(id: index, content: gameEmojis[index]);
    });

    notifyListeners();
  }

  void flipCard(int index) {
    if (_cards[index].isMatched) return;

    _cards[index].isFaceUp = !_cards[index].isFaceUp;
    notifyListeners();
    _checkForMatch();
  }

  void _checkForMatch() {
    List<CardModel> flippedCards =
        _cards.where((card) => card.isFaceUp && !card.isMatched).toList();

    if (flippedCards.length == 2) {
      if (flippedCards[0].content == flippedCards[1].content) {
        flippedCards[0].isMatched = true;
        flippedCards[1].isMatched = true;
      } else {
        Future.delayed(Duration(seconds: 1), () {
          flippedCards.forEach((card) => card.isFaceUp = false);
          notifyListeners();
        });
      }
    }
  }

  bool checkWin() {
    return _cards.every((card) => card.isMatched);
  }

  void resetGame() {
    _initializeCards(); // Reshuffle & reset game
    notifyListeners();
  }
}
