// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularModelAdapter extends TypeAdapter<PopularModel> {
  @override
  final int typeId = 0;

  @override
  PopularModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      profilePath: fields[2] as String?,
      knownDepartment: fields[3] as String?,
      films: (fields[4] as List?)?.cast<FilmModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PopularModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profilePath)
      ..writeByte(3)
      ..write(obj.knownDepartment)
      ..writeByte(4)
      ..write(obj.films);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
