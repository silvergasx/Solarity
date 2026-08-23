import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/baking_screen.dart';
import 'viewmodels/baking_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BakingViewModel(
            // TODO: Replace with your actual Gemini API Key
            apiKey: String.fromEnvironment('GEMINI_API_KEY', defaultValue: 'YOUR_API_KEY_HERE'),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solarsun Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BakingScreen(),
    );
  }
}
