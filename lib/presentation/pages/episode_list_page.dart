import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/episode_bloc/episode_bloc.dart';
import '../widgets/episode_list_tile.dart';
import '../widgets/search_bar.dart';

class EpisodeListPage extends StatelessWidget {
  const EpisodeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodios')),
      body: Column(
        children: [
          SearchBar(
            onSearch: (query) {
              context.read<EpisodeBloc>().add(SearchEpisodes(query));
            },
          ),
          Expanded(
            child: BlocBuilder<EpisodeBloc, EpisodeState>(
              builder: (context, state) {
                if (state is EpisodeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EpisodeLoaded) {
                  return ListView.builder(
                    itemCount: state.episodes.length,
                    itemBuilder: (context, index) {
                      return EpisodeListTile(episode: state.episodes[index]);
                    },
                  );
                } else if (state is EpisodeError) {
                  return const Center(child: Text('Error al cargar episodios'));
                } else if (state is EpisodeEmpty) {
                  return const Center(
                      child: Text('No se encontraron episodios'));
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
