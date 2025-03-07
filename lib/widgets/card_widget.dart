import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../providers/game_provider.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final int index;

  CardWidget({required this.card, required this.index});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        gameProvider.flipCard(index);
        if (gameProvider.checkWin()) {
          Future.delayed(Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(context, "/victory");
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: card.isMatched ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child:
                card.isFaceUp
                    ? Text(
                      card.content,
                      key: ValueKey(card.content),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    : Icon(
                      Icons.question_mark,
                      key: ValueKey("hidden"),
                      size: 40,
                      color: Colors.blue,
                    ),
          ),
        ),
      ),
    );
  }
}
