// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markov.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarkovAdapter extends TypeAdapter<Markov> {
  @override
  final int typeId = 1;

  @override
  Markov read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Markov()
      ..msgCount = fields[0] as int
      ..wordCount = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, Markov obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.msgCount)
      ..writeByte(1)
      ..write(obj.wordCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkovAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
