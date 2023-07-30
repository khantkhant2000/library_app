import 'package:library_app/data/vo/home_page_vo/list_vo/lists_vo.dart';

abstract class BookDataAgent {
  /// home book data agent
  Future<List<ListsVO>?> getHomeScreenBookList(String publishedDate);
}
