import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/presentation/providers/article_provider.dart';
import 'package:clean_architecture_news_app/features/news/presentation/screens/news_details_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNewsWidget extends ConsumerWidget {
  const CategoriesNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCategoryNewsUseCase = ref.watch(getCategoryNewsUseCaseProvider);
    return FutureBuilder<Either<Failure, List<ArticleEntity>>>(
      future: getCategoryNewsUseCase.getCategoryNews('General'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else {
          return snapshot.data!.fold(
            (failure) => Center(child: Text('Failure: $failure')),
            (articles) {
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];

                  return Card(
                    elevation: 4,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      //color: Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Text(
                          article.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            article.urlToImage.toString(),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailsScreen(article: article),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
