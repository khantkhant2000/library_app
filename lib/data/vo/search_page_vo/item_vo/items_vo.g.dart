// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsVO _$ItemsVOFromJson(Map<String, dynamic> json) => ItemsVO(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfoVO.fromJson(json['saleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsVOToJson(ItemsVO instance) => <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
    };
