import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/presentation/providers/article_provider.dart';
import 'package:clean_architecture_news_app/features/news/presentation/widgets/custom_news_headlines_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsHeadlinesScreen extends ConsumerWidget {
  final String channelName;
  const NewsHeadlinesScreen({required this.channelName, Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNewsHeadlinesUseCase = ref.watch(getNewsHeadlinesUseCaseProvider);
    return FutureBuilder<Either<Failure, List<ArticleEntity>>>(
      future: getNewsHeadlinesUseCase.getNewsHeadlines(channelName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else {
          return snapshot.data!.fold(
            (failure) => Center(child: Text('Failure: $failure')),
            (articles) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return CustomNewsHeadlinesWidget(
                      articles: articles,
                      index: index,
                      channelName: channelName,
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
