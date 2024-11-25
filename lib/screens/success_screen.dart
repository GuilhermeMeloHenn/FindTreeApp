import 'package:flutter/material.dart';
import 'add_tree_screen.dart'; // Import da tela para adicionar árvores
import 'tree_detail_screen.dart'; // Import da tela de detalhes da árvore

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dados fictícios para a tabela
    final List<Map<String, String>> data = [
      {"Espécie": "Ingá", "Binômio": "Inga edulis Martius"},
      {"Espécie": "Vazio", "Binômio": "Vazio"},
      {"Espécie": "Vazio", "Binômio": "Vazio"},
      {"Espécie": "Vazio", "Binômio": "Vazio"},
      {"Espécie": "Vazio", "Binômio": "Vazio"},
      {"Espécie": "Vazio", "Binômio": "Vazio"},
      {"Espécie": "Vazio", "Binômio": "Vazio"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.eco,
                size: 24,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Find Tree',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Navegar para a AddTreeScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTreeScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tabela com dados
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(color: Colors.black, width: 0.5),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: IntrinsicColumnWidth(),
                  },
                  children: [
                    // Cabeçalho
                    TableRow(
                      decoration: const BoxDecoration(color: Colors.grey),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Espécie',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Binômio',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox.shrink(), // Coluna para botão
                        ),
                      ],
                    ),
                    // Linhas de dados
                    ...data.map((row) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row["Espécie"] ?? ""),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row["Binômio"] ?? ""),
                          ),
                          // Botão "Ver"
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Navegar para a TreeDetailScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TreeDetailScreen(treeData: row),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                              ),
                              child: const Text(
                                'Ver',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
