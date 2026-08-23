import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/ui_state.dart';

class BakingViewModel extends ChangeNotifier {
  UiState _uiState = Initial();
  UiState get uiState => _uiState;

  final String apiKey;
  late final GenerativeModel _generativeModel;

  BakingViewModel({required this.apiKey}) {
    _generativeModel = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
  }

  Future<void> sendPrompt(Uint8List imageBytes, String prompt) async {
    _uiState = Loading();
    notifyListeners();

    try {
      final content = [
        Content.multi([
          DataPart('image/jpeg', imageBytes),
          TextPart(prompt),
        ])
      ];

      final response = await _generativeModel.generateContent(content);
      
      if (response.text != null) {
        _uiState = Success(response.text!);
      } else {
        _uiState = Error("Empty response from Gemini");
      }
    } catch (e) {
      _uiState = Error(e.toString());
    }
    notifyListeners();
  }
}
