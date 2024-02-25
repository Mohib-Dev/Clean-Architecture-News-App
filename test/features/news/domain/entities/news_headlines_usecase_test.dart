import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/helper_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
  });

  // const testArticleEntity = ArticleEntity(
  //   author: "BBC News",
  //   content:
  //       "Lawyers for Julian Assange are launching what could be his final bid to avoid extradition to the US to face trial over leaking military secrets.\r\nThe two-day hearing at the High Court in London is du… [+2472 chars]",
  //   description:
  //       "The Wikileaks founder is trying to overturn an extradition order signed in 2022 by then UK home secretary Priti Patel.",
  //   publishedAt: "2024-02-20T02:37:13.796475Z",
  //   title:
  //       "Julian Assange: Wikileaks founder in last-ditch bid to avoid US extradition",
  //   url: "https://www.bbc.co.uk/news/uk-68343097",
  //   urlToImage:
  //       "https://ichef.bbci.co.uk/news/1024/branded_news/358D/production/_132690731_jassange.jpg,",
  //   id: "bbc-news",
  //   name: "BBC News",
  // );

  const testChannelName = "bbc-news";

  final List<ArticleEntity> listArticleEntity = [];

  test("It should return an Article Entity", () async {
    // arrange
    when(mockArticleRepository.getNewsHeadlines(testChannelName))
        .thenAnswer((_) async => Right(listArticleEntity));

    // act

    final result =
        await mockArticleRepository.getNewsHeadlines(testChannelName);

    // assert

    expect(result, Right(listArticleEntity));
  });
}
