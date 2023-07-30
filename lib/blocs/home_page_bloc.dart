import 'package:flutter/foundation.dart';
import 'package:library_app/data/vo/home_page_vo/list_vo/lists_vo.dart';
import '../data/model/book_model.dart';
import '../data/model/book_model_impl.dart';
import '../data/vo/home_page_vo/book_vo/books_vo.dart';
import '../data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final BookModel _libraryModel = BookModelImpl();
  HiveSaveBooksVO? hiveSaveBooksVO;
  List<ListsVO> _homeScreenBookList = [];
  int _selectedIndex = 0;
  bool _dispose = false;
  bool isExist = false;

  List<ListsVO>? get getHomeScreenBookList => _homeScreenBookList;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  HomePageBloc() {
    DateTime dateTime = DateTime.now();
    String monthFormat = (dateTime.month.toString().length) == 2
        ? dateTime.month.toString()
        : '0${dateTime.month.toString()}';
    String dayFormat = (dateTime.day.toString().length) == 2
        ? dateTime.day.toString()
        : '0${dateTime.day.toString()}';
    String publishDate = '${dateTime.year}-$monthFormat-$dayFormat';
    _libraryModel.getHomeScreenBookList(publishDate);
    _libraryModel.getHomeScreenBookListFromDataBase().listen((event) {
      if (event != null) {
        _homeScreenBookList = event;
      }

      notifyListeners();
    });
  }

  saveAndDeleteBookHive(BooksVO? booksVO) {
    final bookHiveList =
        HiveSaveBooksVO(title: booksVO?.title, bookImage: booksVO?.bookImage);
    if (isExist) {
      _libraryModel.save(bookHiveList);
      print("this is hive delete =====> $bookHiveList");
    } else {
      _libraryModel.delete(bookHiveList);
      print("this is hive save =====> $bookHiveList");
    }
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
