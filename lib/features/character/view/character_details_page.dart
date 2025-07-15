import 'package:flutter/material.dart';
import '../model/character_model.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(character.image),
          ),
          const SizedBox(height: 20),
          Text(character.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('Status: ${character.status}'),
          Text('Species: ${character.species}'),
          Text('Gender: ${character.gender}'),
        ],
      ),
    );
  }
}
