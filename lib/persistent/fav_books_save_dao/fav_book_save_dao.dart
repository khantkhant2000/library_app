import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';

abstract class FavBooksSaveDAO {
  void save(HiveSaveBooksVO hiveDetailVO);
  void delete(HiveSaveBooksVO hiveDetailVO);
  List<HiveSaveBooksVO>? getHiveDetailVOFromDataBase();
  Stream<List<HiveSaveBooksVO>?> getHiveDetailVOFromDataBaseStream();
  Stream watchFavBooksBox();
}
