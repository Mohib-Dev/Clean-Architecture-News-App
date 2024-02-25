import 'package:clean_architecture_news_app/features/news/domain/repositories/articles_repository.dart';
import 'package:clean_architecture_news_app/features/news/domain/usecases/get_category_news_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_architecture_news_app/features/news/domain/usecases/get_news_headlines_usecase.dart';
import 'package:clean_architecture_news_app/features/news/data/data_sources/article_remote_data_source.dart';
import 'package:clean_architecture_news_app/features/news/data/repositories/articles_repository_implementation.dart';
import 'package:http/http.dart' as http;

final getNewsHeadlinesUseCaseProvider =
    Provider<GetNewsHeadlinesUsecase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return GetNewsHeadlinesUsecase(articleRepository: repository);
});

final articleRepositoryProvider = Provider<ArticleRepository>((ref) {
  return ArticleRepositoryImplementation(
    articleRemoteDataSource: ArticlesRemoteDataSourceImplementation(
      client: http.Client(),
    ),
  );
});

final getCategoryNewsUseCaseProvider = Provider<GetCategoryNewsUsecase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return GetCategoryNewsUsecase(articleRepository: repository);
});
