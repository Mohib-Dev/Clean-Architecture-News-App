class Urls {
  static const API_KEY = "0be1159140254d979dc81ce9e2091041";

  static String getNewsHeadlinesByChannelName(String channelName) =>
      "https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=$API_KEY";

  static String getCategoryNews(String category) =>
      "https://newsapi.org/v2/everything?q=$category&apiKey=$API_KEY";
}
