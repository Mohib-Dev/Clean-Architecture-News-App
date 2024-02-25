import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateNotifierProvider((ref) {
  return CategoryNotifier();
});

class CategoryNotifier extends StateNotifier<String> {
  CategoryNotifier() : super('General');

  void selectCategory(String category) {
    state = category;
  }
}
