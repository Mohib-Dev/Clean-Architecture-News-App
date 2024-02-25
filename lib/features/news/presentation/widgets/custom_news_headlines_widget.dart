import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:clean_architecture_news_app/features/news/presentation/screens/news_details_screen.dart';
import 'package:flutter/material.dart';

class CustomNewsHeadlinesWidget extends StatelessWidget {
  final List<ArticleEntity> articles;
  final int index;
  final String channelName;
  const CustomNewsHeadlinesWidget({
    super.key,
    required this.articles,
    required this.index,
    required this.channelName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailsScreen(article: articles[index]),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(articles[index].urlToImage ?? ''),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 5,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          articles[index].title ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          channelName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
