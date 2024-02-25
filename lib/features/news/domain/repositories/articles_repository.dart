import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getNewsHeadlines(
      String channelName);
  Future<Either<Failure, List<ArticleEntity>>> getCategoryNews(String category);
}
