import 'package:flutter/material.dart';
import '../../../domain/entities/character.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;

  const CharacterListTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          maxRadius: 40, backgroundImage: NetworkImage(character.image)),
      title: Text(
        character.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${character.species} - ${character.status}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/character_detail', arguments: character);
      },
    );
  }
}
