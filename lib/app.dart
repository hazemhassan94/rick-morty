import 'package:flutter/material.dart';
import 'features/character/view/character_page.dart';

class RickApp extends StatelessWidget {
  const RickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick & Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const CharacterPage(),
    );
  }
}
