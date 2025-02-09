import 'package:flutter/material.dart';
import '../../../domain/entities/location.dart';

class LocationDetailPage extends StatelessWidget {
  final Location location;

  const LocationDetailPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${location.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Tipo: ${location.type}'),
            const SizedBox(height: 8),
            Text('Dimensión: ${location.dimension}'),
            const SizedBox(height: 16),
            const Text(
              'Residentes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: location.residents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Residente ${index + 1}'),
                    subtitle: Text(location.residents[index]),
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
