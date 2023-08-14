class Urls {
  static const String apiKey = '8ceba317-da1a-4268-8c06-44129f845e9f';
  static const String baseUrl = 'https://equran.id';

  static const String surah = '/api/v2/surat';
  static String detailSurah(int surahNumber) => '/api/v2/surat/$surahNumber';
}
