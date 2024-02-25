import 'package:clean_architecture_news_app/core/error/failure.dart';
import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/presentation/providers/article_provider.dart';
import 'package:clean_architecture_news_app/features/news/presentation/providers/selected_category_provider.dart';
import 'package:clean_architecture_news_app/features/news/presentation/widgets/custom_categories_button.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CategoriesScreen extends ConsumerWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  final format = DateFormat("MMMM dd,yyyy");
  final List<String> categoriesList = [
    "General",
    "Entertainment",
    "Health",
    "Sports",
    "Business",
    "Technology"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryName = ref.watch(selectedCategoryProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //
            CustomCategoriesButton(
                categoriesList: categoriesList, categoryName: categoryName),
            //
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<Either<Failure, List<ArticleEntity>>>(
                future: ref
                    .watch(getCategoryNewsUseCaseProvider)
                    .getCategoryNews(categoryName as String),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error.toString()}'));
                  } else {
                    return snapshot.data!.fold(
                        (failure) => Center(child: Text('Failure: $failure')),
                        (articles) {
                      return ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final article = articles[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    article.urlToImage.toString(),
                                    fit: BoxFit.cover,
                                    height: height * .18,
                                    width: width * .3,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    height: height * 0.18,
                                    child: Column(
                                      children: [
                                        Text(
                                          article.title.toString(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              format.format(DateTime.parse(
                                                  article.publishedAt
                                                      .toString())),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xFF000000),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
