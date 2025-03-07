// import 'package:flutter/material.dart';
// import '../widgets/card_widget.dart';
// import '../providers/game_provider.dart';
// import 'package:provider/provider.dart';

// class GameScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final gameProvider = Provider.of<GameProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Memory Match Game", style: TextStyle(fontSize: 22)),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple.shade700, Colors.deepPurple.shade400],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4,
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//             ),
//             itemCount: gameProvider.cards.length,
//             itemBuilder: (context, index) {
//               return CardWidget(card: gameProvider.cards[index], index: index);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';
import '../providers/game_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Memory Match Game", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFE6E6FA), // Lavender background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: gameProvider.cards.length,
            itemBuilder: (context, index) {
              return CardWidget(card: gameProvider.cards[index], index: index);
            },
          ),
        ),
      ),
    );
  }
}
