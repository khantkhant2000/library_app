// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      kind: json['kind'] as String?,
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
