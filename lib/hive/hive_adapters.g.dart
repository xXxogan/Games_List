// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CollectionTypeAdapter extends TypeAdapter<CollectionType> {
  @override
  final typeId = 1;

  @override
  CollectionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CollectionType.favorite;
      case 1:
        return CollectionType.completed;
      case 2:
        return CollectionType.planned;
      case 3:
        return CollectionType.dropped;
      default:
        return CollectionType.favorite;
    }
  }

  @override
  void write(BinaryWriter writer, CollectionType obj) {
    switch (obj) {
      case CollectionType.favorite:
        writer.writeByte(0);
      case CollectionType.completed:
        writer.writeByte(1);
      case CollectionType.planned:
        writer.writeByte(2);
      case CollectionType.dropped:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CollectionItemAdapter extends TypeAdapter<CollectionItem> {
  @override
  final typeId = 3;

  @override
  CollectionItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollectionItem(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      type: fields[3] as CollectionType,
      addedAt: fields[4] as DateTime,
      image: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CollectionItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.addedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchHistoryWordAdapter extends TypeAdapter<SearchHistoryWord> {
  @override
  final typeId = 4;

  @override
  SearchHistoryWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchHistoryWord(
      id: fields[0] as String,
      history: fields[1] as String,
      addedAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SearchHistoryWord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.history)
      ..writeByte(2)
      ..write(obj.addedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchHistoryWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
