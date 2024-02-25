import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';

class GetNewsHeadlinesUsecase {
  final ArticleRepository articleRepository;

  GetNewsHeadlinesUsecase({required this.articleRepository});

  Future<Either<Failure, List<ArticleEntity>>> getNewsHeadlines(
      String channelName) {
    return articleRepository.getNewsHeadlines(channelName);
  }
}
