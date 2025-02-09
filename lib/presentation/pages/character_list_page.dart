import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/character_bloc/character_bloc.dart';
import '../blocs/character_bloc/character_event.dart';
import '../blocs/character_bloc/character_state.dart';
import '../widgets/character_list_tile.dart';
import '../widgets/search_bar.dart' as searchbar;

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes')),
      body: Column(
        children: [
          searchbar.SearchBar(onSearch: (query) {
            context.read<CharacterBloc>().add(SearchCharacters(query));
          }),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state is CharacterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CharacterLoaded) {
                  return ListView.builder(
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) {
                      return CharacterListTile(
                          character: state.characters[index]);
                    },
                  );
                } else if (state is CharacterError) {
                  return const Center(
                      child: Text('Error al cargar personajes'));
                } else if (state is CharacterEmpty) {
                  return const Center(
                      child: Text('No se encontraron personajes'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
