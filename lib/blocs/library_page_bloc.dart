import 'package:flutter/foundation.dart';
import 'package:library_app/data/model/book_model.dart';
import 'package:library_app/data/model/book_model_impl.dart';
import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';

class LibraryPageBloc extends ChangeNotifier {
  final BookModel _libraryModel = BookModelImpl();

  List<HiveSaveBooksVO> _saveBooksList = [];
  bool _dispose = false;

  List<HiveSaveBooksVO> get getBookHiveList => _saveBooksList;

  LibraryPageBloc() {
    _libraryModel.getBookHiveListFromDataBase().listen((event) {
      if (event != null) {
        _saveBooksList = event;
      }
      notifyListeners();
    });
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
