import 'package:dio/dio.dart';
import 'package:library_app/data/vo/search_page_vo/item_vo/items_vo.dart';
import 'package:library_app/network/data_agent/search_book_data_agent/search_book_data_agent.dart';

import '../../api/search_page_api/search_api.dart';

class SearchBooksDataAgentImpl extends SearchBooksDataAgent {
  late LibraryAPI _api;
  SearchBooksDataAgentImpl._() {
    _api = LibraryAPI(Dio());
  }
  static final SearchBooksDataAgentImpl _singleton =
      SearchBooksDataAgentImpl._();
  factory SearchBooksDataAgentImpl() => _singleton;

  @override
  Future<List<ItemsVO>?> getSearchBook(String bookName) => _api
      .getSearchResponse(bookName)
      .asStream()
      .map((event) => event.items)
      .first;
}
