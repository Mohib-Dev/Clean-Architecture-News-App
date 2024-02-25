import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoryNewsUsecase {
  final ArticleRepository articleRepository;

  GetCategoryNewsUsecase({required this.articleRepository});

  Future<Either<Failure, List<ArticleEntity>>> getCategoryNews(
      String category) {
    return articleRepository.getCategoryNews(category);
  }
}
