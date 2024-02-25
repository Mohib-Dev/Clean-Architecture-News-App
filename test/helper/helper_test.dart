import 'package:clean_architecture_news_app/features/news/domain/repositories/articles_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [ArticleRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
