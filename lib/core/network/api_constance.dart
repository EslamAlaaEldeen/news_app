class ApiConstance {
  static const String baseUrl = "https://newsapi.org/";
  static const String apiKey = "16367fed0709431e9ff15c29940e9f7c";

  static const String businessPath =
      "$baseUrl/v2/top-headlines?country=us&category=business&apiKey=$apiKey";
  static const String sportsPath =
      "$baseUrl/v2/top-headlines?country=us&category=sports&apiKey=$apiKey";
  static const String sciencePath =
      "$baseUrl/v2/top-headlines?country=us&category=science&apiKey=$apiKey";
  static String searchPath(String value) =>
      "$baseUrl/v2/top-headlines?q=$value&apiKey=$apiKey";
}
