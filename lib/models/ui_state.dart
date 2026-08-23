abstract class UiState {}

class Initial extends UiState {}

class Loading extends UiState {}

class Success extends UiState {
  final String outputText;
  Success(this.outputText);
}

class Error extends UiState {
  final String errorMessage;
  Error(this.errorMessage);
}
