import 'dart:io';
import 'package:clean_architecture_news_app/core/error/exception.dart';
import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/data/data_sources/article_remote_data_source.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/domain/repositories/articles_repository.dart';
import 'package:dartz/dartz.dart';

class ArticleRepositoryImplementation extends ArticleRepository {
  final ArticleRemoteDataSource articleRemoteDataSource;

  ArticleRepositoryImplementation({required this.articleRemoteDataSource});

  @override
  Future<Either<Failure, List<ArticleEntity>>> getNewsHeadlines(
      String channelName) async {
    try {
      final result =
          await articleRemoteDataSource.getNewsHeadlines(channelName);
      return Right(
          result.map((articleModel) => articleModel.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the Network"));
    }
  }

  //

  @override
  Future<Either<Failure, List<ArticleEntity>>> getCategoryNews(
      String category) async {
    try {
      final result = await articleRemoteDataSource.getCategoriesNews(category);
      return Right(
          result.map((articleModel) => articleModel.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("An error has occurred"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the Network"));
    }
  }
}
