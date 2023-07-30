import 'package:hive/hive.dart';
import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';
import 'package:library_app/persistent/fav_books_save_dao/fav_book_save_dao.dart';
import '../../constant/hive_constant.dart';

class FavBooksSaveDAOImpl extends FavBooksSaveDAO {
  FavBooksSaveDAOImpl._();
  static final FavBooksSaveDAOImpl _singleton = FavBooksSaveDAOImpl._();
  factory FavBooksSaveDAOImpl() => _singleton;

  @override
  List<HiveSaveBooksVO>? getHiveDetailVOFromDataBase() =>
      _hiveDetailBox().values.toList();

  @override
  Stream<List<HiveSaveBooksVO>?> getHiveDetailVOFromDataBaseStream() =>
      Stream.value(getHiveDetailVOFromDataBase());

  @override
  void save(HiveSaveBooksVO hiveDetailVO) =>
      _hiveDetailBox().put(hiveDetailVO.title, hiveDetailVO);

  @override
  Stream watchFavBooksBox() => _hiveDetailBox().watch();
  Box<HiveSaveBooksVO> _hiveDetailBox() =>
      Hive.box<HiveSaveBooksVO>(kBoxNameForSaveBooks);

  @override
  void delete(HiveSaveBooksVO hiveDetailVO) =>
      _hiveDetailBox().delete(hiveDetailVO.title);
}
