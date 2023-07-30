// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_details_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSaveBooksVOAdapter extends TypeAdapter<HiveSaveBooksVO> {
  @override
  final int typeId = 5;

  @override
  HiveSaveBooksVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSaveBooksVO(
      title: fields[0] as String?,
      bookImage: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSaveBooksVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.bookImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSaveBooksVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
