class LanguageModel {
  final String languageName;
  final String languageCode;

  LanguageModel({this.languageName, this.languageCode});
}

List<LanguageModel> languageData = [
  LanguageModel(
    languageName: 'Engish (India)',
    languageCode: 'en_IN',
  ),
  LanguageModel(
    languageName: 'Hindi',
    languageCode: 'hi_IN',
  ),
  LanguageModel(
    languageName: 'French',
    languageCode: 'fr_FR',
  ),
  LanguageModel(
    languageName: 'Russian',
    languageCode: 'ru_RU',
  ),
  LanguageModel(
    languageName: 'Spanish',
    languageCode: 'es_ES',
  ),
];
