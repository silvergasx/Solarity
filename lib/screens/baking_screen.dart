import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../viewmodels/baking_view_model.dart';
import '../models/ui_state.dart';

class BakingScreen extends StatefulWidget {
  const BakingScreen({super.key});

  @override
  State<BakingScreen> createState() => _BakingScreenState();
}

class _BakingScreenState extends State<BakingScreen> {
  final List<String> images = [
    'assets/images/baked_goods_1.jpg',
    'assets/images/baked_goods_2.jpg',
    'assets/images/baked_goods_3.jpg',
  ];

  final List<String> imageDescriptions = [
    'Cupcake',
    'Cookies',
    'Cake',
  ];

  int selectedImageIndex = 0;
  final TextEditingController _promptController = TextEditingController(
    text: "Provide a recipe for the baked goods in the image",
  );

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BakingViewModel>(context);
    final uiState = viewModel.uiState;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Baking with Gemini"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Baking with Gemini",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: selectedImageIndex == index
                          ? Border.all(color: Theme.of(context).primaryColor, width: 4)
                          : null,
                    ),
                    child: Image.asset(
                      images[index],
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                         return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _promptController,
                    decoration: const InputDecoration(
                      labelText: "Prompt",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _promptController.text.isNotEmpty
                      ? () async {
                          final byteData = await rootBundle.load(images[selectedImageIndex]);
                          final bytes = byteData.buffer.asUint8List();
                          viewModel.sendPrompt(bytes, _promptController.text);
                        }
                      : null,
                  child: const Text("Go"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildResultWidget(uiState),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultWidget(UiState uiState) {
    if (uiState is Loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (uiState is Success) {
      return SingleChildScrollView(
        child: Text(
          uiState.outputText,
          style: const TextStyle(fontSize: 16),
        ),
      );
    } else if (uiState is Error) {
      return SingleChildScrollView(
        child: Text(
          uiState.errorMessage,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      );
    } else {
      return const Center(
        child: Text(
          "(Results will appear here)",
          style: TextStyle(fontSize: 16),
        ),
      );
    }
  }
}
