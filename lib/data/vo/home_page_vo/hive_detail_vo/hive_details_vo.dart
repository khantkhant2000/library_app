import 'package:hive/hive.dart';
import '../../../../constant/hive_constant.dart';
part 'hive_details_vo.g.dart';

@HiveType(typeId: kHiveTypeSaveBooks)
class HiveSaveBooksVO {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? bookImage;

  HiveSaveBooksVO({this.title, this.bookImage});
}
