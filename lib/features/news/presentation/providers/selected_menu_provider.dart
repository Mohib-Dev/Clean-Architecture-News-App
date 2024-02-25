import 'package:clean_architecture_news_app/core/constants/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedMenuProvider = StateProvider<FilterList?>((ref) => null);
final nameProvider = StateProvider<String>((ref) => "al-jazeera-english");
