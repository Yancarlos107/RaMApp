import 'package:digital_test/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:digital_test/presentation/blocs/favorite_bloc/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character.dart';
import '../blocs/favorite_bloc/favorite_event.dart';

class CharacterDetailPage extends StatefulWidget {
  final Character? character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(CheckIsFavorite(widget.character!.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.character == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No se recibió el personaje.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character!.name),
        actions: [
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteStatus) {
                return IconButton(
                  icon: Icon(
                    state.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: state.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    context
                        .read<FavoriteBloc>()
                        .add(ToggleFavorites(widget.character!.id));
                  },
                );
              }
              return IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.character!.image),
            const SizedBox(height: 16),
            Text('Especie: ${widget.character!.species}'),
            Text('Estado: ${widget.character!.status}'),
          ],
        ),
      ),
    );
  }
}
