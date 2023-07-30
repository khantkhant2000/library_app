import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';
import 'package:library_app/data/vo/home_page_vo/list_vo/lists_vo.dart';
import 'package:library_app/data/vo/search_page_vo/item_vo/items_vo.dart';
import 'package:library_app/network/data_agent/home_book_data_agent/book_data_agent.dart';
import 'package:library_app/network/data_agent/home_book_data_agent/book_data_agent_impl.dart';
import 'package:library_app/network/data_agent/search_book_data_agent/search_book_data_agent_impl.dart';
import 'package:library_app/persistent/fav_books_save_dao/fav_book_save_dao_impl.dart';
import 'package:library_app/persistent/home_view_book_dao/home_view_book_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../network/data_agent/search_book_data_agent/search_book_data_agent.dart';
import '../../persistent/fav_books_save_dao/fav_book_save_dao.dart';
import '../../persistent/home_view_book_dao/home_book_view_dao.dart';

class BookModelImpl extends BookModel {
  BookModelImpl._();
  static final BookModelImpl _singleton = BookModelImpl._();
  factory BookModelImpl() => _singleton;

  //data agent
  final BookDataAgent bookDataAgent = BookDataAgentImpl();
  final SearchBooksDataAgent searchBooksDataAgent = SearchBooksDataAgentImpl();
  //dao
  final HomeViewBookDao homeViewBookDao = HomeViewBookDaoImpl();
  final FavBooksSaveDAO favBooksSaveDAO = FavBooksSaveDAOImpl();

  @override
  Stream<List<HiveSaveBooksVO>?> getBookHiveListFromDataBase() =>
      favBooksSaveDAO
          .watchFavBooksBox()
          .startWith(favBooksSaveDAO.getHiveDetailVOFromDataBaseStream())
          .map((event) => favBooksSaveDAO.getHiveDetailVOFromDataBase());

  @override
  Future<List<ListsVO>?> getHomeScreenBookList(String publishedDate) =>
      bookDataAgent.getHomeScreenBookList(publishedDate).then((value) {
        if (value != null) {
          homeViewBookDao.save(value);
        }
        return value;
      });

  @override
  Stream<List<ListsVO>?> getHomeScreenBookListFromDataBase() => homeViewBookDao
      .watchHomeScreenBox()
      .startWith(homeViewBookDao.getHomeScreenBookListFromDataBaseStream())
      .map((event) => homeViewBookDao.getHomeScreenBookListFromDataBase());

  @override
  Future<List<ItemsVO>?> getSearchBookList(String bookName) =>
      searchBooksDataAgent.getSearchBook(bookName);

  @override
  void save(HiveSaveBooksVO bookHiveVO) => favBooksSaveDAO.save(bookHiveVO);

  @override
  void delete(HiveSaveBooksVO bookHiveVO) => favBooksSaveDAO.delete(bookHiveVO);
}
