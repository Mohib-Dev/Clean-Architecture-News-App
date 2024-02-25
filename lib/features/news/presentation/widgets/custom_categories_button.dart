import 'package:clean_architecture_news_app/features/news/presentation/providers/selected_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategoriesButton extends ConsumerWidget {
  const CustomCategoriesButton({
    super.key,
    required this.categoriesList,
    required this.categoryName,
  });

  final List<String> categoriesList;
  final Object? categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ref
                  .read(selectedCategoryProvider.notifier)
                  .selectCategory(categoriesList[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: categoryName == categoriesList[index]
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                      child: Text(
                    categoriesList[index],
                    style:
                        GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
