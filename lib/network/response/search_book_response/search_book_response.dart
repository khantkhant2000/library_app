import 'package:json_annotation/json_annotation.dart';

import '../../../data/vo/search_page_vo/item_vo/items_vo.dart';
part 'search_book_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'totalItems')
  int? totalItems;
  @JsonKey(name: 'items')
  List<ItemsVO>? items;

  SearchResponse({this.kind, this.totalItems, this.items});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
