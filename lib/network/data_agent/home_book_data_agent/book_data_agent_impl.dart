import 'package:dio/dio.dart';
import 'package:library_app/constant/api_constant.dart';
import 'package:library_app/network/data_agent/home_book_data_agent/book_data_agent.dart';
import '../../../data/vo/home_page_vo/list_vo/lists_vo.dart';
import '../../api/home_page_api/home_book_api.dart';

class BookDataAgentImpl extends BookDataAgent {
  late LibraryHomePageAPI _api;

  BookDataAgentImpl._() {
    _api = LibraryHomePageAPI(Dio());
  }

  static final BookDataAgentImpl _singleton = BookDataAgentImpl._();
  factory BookDataAgentImpl() => _singleton;

  @override
  Future<List<ListsVO>?> getHomeScreenBookList(String publishedDate) => _api
      .getBookResponse(publishedDate, kApiKey)
      .asStream()
      .map((event) => event.results?.lists)
      .first;
}
