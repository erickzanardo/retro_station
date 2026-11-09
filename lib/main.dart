import 'package:flutter/material.dart';

void main() {
  runApp(const RetroStationApp());
}

class RetroStationApp extends StatelessWidget {
  const RetroStationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Station',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
      home: const Scaffold(
        body: Center(child: Text('Retro Station')),
      ),
    );
  }
}
