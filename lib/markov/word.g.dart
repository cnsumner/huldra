// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 0;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      fields[0] as String,
    )
      ..prefixes = (fields[1] as Map)?.cast<String, int>()
      ..suffixes = (fields[2] as Map)?.cast<String, int>()
      ..distFromHead = (fields[3] as Map)?.cast<int, int>()
      ..distFromTail = (fields[4] as Map)?.cast<int, int>()
      ..totalOccurances = fields[5] as int
      ..msgOccurances = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.word)
      ..writeByte(1)
      ..write(obj.prefixes)
      ..writeByte(2)
      ..write(obj.suffixes)
      ..writeByte(3)
      ..write(obj.distFromHead)
      ..writeByte(4)
      ..write(obj.distFromTail)
      ..writeByte(5)
      ..write(obj.totalOccurances)
      ..writeByte(6)
      ..write(obj.msgOccurances);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
