import 'package:flutter/material.dart';
import '../../../domain/entities/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.image),
            const SizedBox(height: 16),
            Text('Especie: ${character.species}'),
            Text('Estado: ${character.status}'),
          ],
        ),
      ),
    );
  }
}
