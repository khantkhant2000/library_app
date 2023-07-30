import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';
import 'package:library_app/data/vo/home_page_vo/list_vo/lists_vo.dart';
import '../vo/search_page_vo/item_vo/items_vo.dart';

abstract class BookModel {
  //search book
  Future<List<ItemsVO>?> getSearchBookList(String bookName);

  // home books list
  Future<List<ListsVO>?> getHomeScreenBookList(String publishedDate);

  Stream<List<ListsVO>?> getHomeScreenBookListFromDataBase();

  void save(HiveSaveBooksVO bookHiveVO);
  void delete(HiveSaveBooksVO bookHiveVO);

  Stream<List<HiveSaveBooksVO>?> getBookHiveListFromDataBase();
}
