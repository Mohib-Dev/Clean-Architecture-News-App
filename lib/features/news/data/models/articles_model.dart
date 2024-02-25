import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content,
      required super.id,
      required super.name});

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != ""
          ? map['urlToImage']
          : "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
      id: map["id"],
      name: map["name"],
    );
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      id: id,
      name: name,
    );
  }
}
