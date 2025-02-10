import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch; // Llamada cuando se realiza una búsqueda
  final VoidCallback onCancel; // Llamada cuando se cancela la búsqueda

  const SearchBar({
    super.key,
    required this.onSearch,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSearch,
              decoration: const InputDecoration(
                labelText: 'Buscar personaje',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final query = controller.text.trim();
              if (query.isNotEmpty) {
                onSearch(query); // Llama a la función de búsqueda
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.clear(); // Limpia el campo de texto
              onCancel(); // Llama a la función de cancelación
            },
          ),
        ],
      ),
    );
  }
}
