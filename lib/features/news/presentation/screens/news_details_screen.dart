import 'package:clean_architecture_news_app/features/news/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatelessWidget {
  final ArticleEntity article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final format = DateFormat("MMMM dd,yyyy");
    final dateTime = DateTime.parse(article.publishedAt.toString());

    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            SizedBox(
              height: height * 0.45,
              child: ClipRRect(
                  child: Image.network(
                article.urlToImage.toString(),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              height: height * 0.6,
              margin: EdgeInsets.only(top: height * 0.4),
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(color: Colors.white),
              child: ListView(
                children: [
                  Text(
                    article.title.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.author.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        format.format(dateTime),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    article.description.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
