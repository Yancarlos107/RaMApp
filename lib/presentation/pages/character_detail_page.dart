import 'package:flutter/material.dart';
import '../../../domain/entities/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character? character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    if (character == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No se recibió el personaje.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(character!.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                character!.image), // Usa directamente la propiedad del objeto
            const SizedBox(height: 16),
            Text('Especie: ${character!.species}'),
            Text('Estado: ${character!.status}'),
          ],
        ),
      ),
    );
  }
}
