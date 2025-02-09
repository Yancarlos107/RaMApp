import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../../../domain/entities/character.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;

  const CharacterListTile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
      title: Text(character.name),
      subtitle: Text('${character.species} - ${character.status}'),
      onTap: () {
        print('Pantalla personaje');
        print(
            'Detalles del personaje antes de navegar: ${character.name}, ${character.species}, ${character.status}');
        if (character != null) {
          print('los arguemntos no son nulls');
          Navigator.pushNamed(context, '/character_detail',
              arguments: character);
        } else {
          print('ERROR: Character es nulo antes de navegar.');
        }
      },
    );
  }
}
