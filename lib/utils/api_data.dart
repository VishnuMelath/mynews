class ApiCredential {
  static const apikey = 'e588e1839de24545a7b72ecd3dc10bf3';
  String getUrl(String countryCode)
  {
    return 'https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=$apikey';
  }
}