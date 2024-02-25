import 'package:clean_architecture_news_app/core/constants/enums.dart';
import 'package:clean_architecture_news_app/features/news/presentation/providers/selected_menu_provider.dart';
import 'package:clean_architecture_news_app/features/news/presentation/screens/categories_screen.dart';
import 'package:clean_architecture_news_app/features/news/presentation/screens/news_headlines_screen.dart';
import 'package:clean_architecture_news_app/features/news/presentation/widgets/custom_categories_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final format = DateFormat("MMMM dd,yyyy");

  FilterList? selectedMenu;

  String name = "al-jazeera-english";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenu = ref.watch(selectedMenuProvider);
    final name = ref.watch(nameProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            PopupMenuButton<FilterList>(
                onSelected: (item) {
                  ref.read(nameProvider.state).update((state) {
                    switch (item) {
                      case FilterList.bbcNews:
                        return "bbc-news";

                      case FilterList.aryNews:
                        return "ary-news";

                      case FilterList.cnn:
                        return "cnn";

                      case FilterList.independent:
                        return "independent";

                      case FilterList.reuters:
                        return "reuters";

                      case FilterList.alJazeera:
                        return "al-jazeera-english";
                    }
                  });

                  ref.read(selectedMenuProvider.state).update((state) => item);
                },
                initialValue: selectedMenu,
                itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
                      const PopupMenuItem<FilterList>(
                        value: FilterList.bbcNews,
                        child: Text("BBC News"),
                      ),
                      const PopupMenuItem<FilterList>(
                        value: FilterList.aryNews,
                        child: Text("Ary News"),
                      ),
                      const PopupMenuItem<FilterList>(
                        value: FilterList.cnn,
                        child: Text("CNN"),
                      ),
                      const PopupMenuItem<FilterList>(
                        value: FilterList.alJazeera,
                        child: Text("AlJazeera"),
                      ),
                      const PopupMenuItem<FilterList>(
                        value: FilterList.independent,
                        child: Text("Independent"),
                      ),
                      const PopupMenuItem<FilterList>(
                        value: FilterList.reuters,
                        child: Text("Reuters"),
                      ),
                    ])
          ],
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesScreen(),
                    ));
              },
              icon: const Icon(Icons.menu_rounded)),
          title: Text(
            "News",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: NewsHeadlinesScreen(channelName: name)),
            const SizedBox(height: 10),
            const Expanded(child: CategoriesNewsWidget()),
          ],
        ));
  }
}
