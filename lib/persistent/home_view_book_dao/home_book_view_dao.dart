import '../../data/vo/home_page_vo/list_vo/lists_vo.dart';

abstract class HomeViewBookDao {
  void save(List<ListsVO> bookListVO);

  List<ListsVO>? getHomeScreenBookListFromDataBase();

  Stream<List<ListsVO>?> getHomeScreenBookListFromDataBaseStream();

  Stream watchHomeScreenBox();

  void deleteHomeScreenBox(List<ListsVO> bookListVO);
}
