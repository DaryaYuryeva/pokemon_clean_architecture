// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonDetailsModelAdapter extends TypeAdapter<PokemonDetailsModel> {
  @override
  final int typeId = 1;

  @override
  PokemonDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonDetailsModel(
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
      types: (fields[3] as List).cast<String>(),
      weight: fields[4] as int,
      height: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonDetailsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.types)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
