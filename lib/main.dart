import 'package:flutter/material.dart';
import 'screens/mode_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Monitor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ModeSelectionScreen(),
    );
  }
}
