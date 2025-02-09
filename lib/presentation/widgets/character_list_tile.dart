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
        AppRoutes.navigateTo(context, AppRoutes.characterDetail,
            arguments: character);
      },
    );
  }
}
