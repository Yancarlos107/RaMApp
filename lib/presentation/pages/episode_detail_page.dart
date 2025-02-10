import 'package:flutter/material.dart';
import '../../../domain/entities/episode.dart';

class EpisodeDetailPage extends StatelessWidget {
  final Episode episode;

  const EpisodeDetailPage({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(episode.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${episode.name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text('Código del Episodio: ${episode.episodeCode}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            const SizedBox(height: 8),
            Text('Fecha de Emisión: ${episode.airDate}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )),
            const SizedBox(height: 16),
            const Text(
              'Personajes:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: episode.characters.length,
                itemBuilder: (context, index) {
                  final url =
                      transformRickAndMortyUrl(episode.characters[index]);
                  return ListTile(
                    leading: CircleAvatar(
                        maxRadius: 40, backgroundImage: NetworkImage(url)),
                    title: Text('Personaje ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    subtitle: Text(episode.characters[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
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

String transformRickAndMortyUrl(String url) {
  if (url.contains('/api/character/')) {
    String id = url.substring(url.lastIndexOf('/') + 1); // Extrae el ID
    return 'https://rickandmortyapi.com/api/character/avatar/$id.jpeg';
  }
  return url;
}
