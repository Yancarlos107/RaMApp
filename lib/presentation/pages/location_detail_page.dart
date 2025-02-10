import 'package:flutter/material.dart';
import '../../../domain/entities/location.dart';

class LocationDetailPage extends StatelessWidget {
  final Location? location;

  const LocationDetailPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(
          location!.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${location!.name}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Tipo: ${location!.type}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Dimensión: ${location!.dimension}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Residentes:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: location!.residents.length,
                itemBuilder: (context, index) {
                  final url =
                      transformRickAndMortyUrl(location!.residents[index]);
                  return ListTile(
                    leading: CircleAvatar(
                        maxRadius: 40, backgroundImage: NetworkImage(url)),
                    title: Text(
                      'Residente ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(location!.residents[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
  return url; // Devuelve la misma URL si no coincide el formato
}
