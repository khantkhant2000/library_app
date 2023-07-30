import 'package:json_annotation/json_annotation.dart';
import '../sale_info_vo/sales_info_vo.dart';
import '../volume_info_vo/volumes_info_vo.dart';
part 'items_vo.g.dart';

@JsonSerializable()
class ItemsVO {
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'selfLink')
  String? selfLink;
  @JsonKey(name: 'volumeInfo')
  VolumeInfoVO? volumeInfo;
  @JsonKey(name: 'saleInfo')
  SaleInfoVO? saleInfo;

  ItemsVO({
    this.kind,
    this.id,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
  });

  factory ItemsVO.fromJson(Map<String, dynamic> json) =>
      _$ItemsVOFromJson(json);
}
