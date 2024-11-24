import 'package:flutter/material.dart';

class AddTreeScreen extends StatelessWidget {
  const AddTreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Find Tree',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação para adicionar imagem
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade400,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                  ),
                  child: const Text(
                    'Adicionar imagem',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ..._buildTextFields(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    final List<String> labels = [
      "Nome:",
      "Biologia reprodutiva:",
      "Ocorrência natural (mapa):",
      "Aspectos ecológicos (pragas):",
      "Regeneração natural:",
      "Aproveitamento - Alimentação:",
      "Aproveitamento - Biotecnológico energético:",
    ];

    return labels.map((label) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
