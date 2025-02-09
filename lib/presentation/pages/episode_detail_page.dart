import 'package:flutter/material.dart';
import '../../../domain/entities/episode.dart';

class EpisodeDetailPage extends StatelessWidget {
  final Episode episode;

  const EpisodeDetailPage({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${episode.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Código del Episodio: ${episode.episodeCode}'),
            const SizedBox(height: 8),
            Text('Fecha de Emisión: ${episode.airDate}'),
            const SizedBox(height: 16),
            const Text(
              'Personajes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: episode.characters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Personaje ${index + 1}'),
                    subtitle: Text(episode.characters[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
