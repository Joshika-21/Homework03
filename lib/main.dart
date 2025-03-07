import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/game_screen.dart';
import 'screens/victory_screen.dart';
import 'providers/game_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => GameProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => GameScreen(),
        "/victory": (context) => VictoryScreen(),
      },
    );
  }
}
