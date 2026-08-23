/// App constants and configuration
class AppConstants {
  AppConstants._();
  
  // App Info
  static const String appName = 'Solar Sun';
  static const String appVersion = '2.0.0';
  static const String appTagline = 'AI-Powered Baking Assistant';
  
  // API
  static const String geminiModel = 'gemini-1.5-flash-latest';
  static const String geminiModelPro = 'gemini-1.5-pro-latest';
  
  // Image
  static const int maxImageSizeMB = 5;
  static const int imageQuality = 85;
  
  // Storage Keys
  static const String prefsTheme = 'app_theme_mode';
  static const String prefsLanguage = 'app_language';
  static const String prefsRecipes = 'saved_recipes';
  static const String prefsApiKey = 'gemini_api_key';
  
  // Default Prompts
  static const String defaultPrompt = 'Provide a detailed recipe for the baked goods in the image. Include ingredients, instructions, and tips.';
  static const String analyzePrompt = 'Analyze this baked good. What is it? Describe its appearance, likely ingredients, and baking difficulty level.';
  static const String healthPrompt = 'Analyze the nutritional aspects of this baked good. Provide approximate calorie count and health considerations.';
  
  // Asset Paths
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';
}
