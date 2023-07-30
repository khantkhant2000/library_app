import '../../../data/vo/search_page_vo/item_vo/items_vo.dart';

abstract class SearchBooksDataAgent {
  Future<List<ItemsVO>?> getSearchBook(String bookName);
}
