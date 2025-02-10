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
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Buscar',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              final query = controller.text.trim();
              if (query.isNotEmpty) {
                onSearch(query); // Llama a la función de búsqueda
              }
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
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
