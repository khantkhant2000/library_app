import 'package:hive/hive.dart';
import 'package:library_app/persistent/home_view_book_dao/home_book_view_dao.dart';
import '../../constant/hive_constant.dart';
import '../../data/vo/home_page_vo/list_vo/lists_vo.dart';

class HomeViewBookDaoImpl extends HomeViewBookDao {
  HomeViewBookDaoImpl._();
  static final HomeViewBookDaoImpl _singleton = HomeViewBookDaoImpl._();
  factory HomeViewBookDaoImpl() => _singleton;

  @override
  void deleteHomeScreenBox(List<ListsVO> bookListVO) {
    for (ListsVO booksVO in bookListVO) {
      _bookListBox().delete(booksVO.listId);
    }
  }

  @override
  List<ListsVO>? getHomeScreenBookListFromDataBase() =>
      _bookListBox().values.toList();

  @override
  Stream<List<ListsVO>?> getHomeScreenBookListFromDataBaseStream() =>
      Stream.value(getHomeScreenBookListFromDataBase());

  @override
  void save(List<ListsVO> bookListVO) {
    for (ListsVO bookListsVO in bookListVO) {
      _bookListBox().put(bookListsVO.listId, bookListsVO);
    }
  }

  @override
  Stream watchHomeScreenBox() => _bookListBox().watch();

  Box<ListsVO> _bookListBox() => Hive.box<ListsVO>(kBoxNameForBook);
}
