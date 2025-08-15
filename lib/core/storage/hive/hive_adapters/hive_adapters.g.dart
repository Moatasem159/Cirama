// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class MediaSearchModelAdapter extends TypeAdapter<MediaSearchModel> {
  @override
  final typeId = 0;

  @override
  MediaSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaSearchModel(
      overview: fields[0] as String,
      backdropPath: fields[1] as String,
      id: (fields[2] as num).toInt(),
      mediaType: fields[3] as String,
      name: fields[4] as String,
      originalName: fields[5] as String,
      releaseDate: fields[6] as String,
      profilePath: fields[7] == null ? '' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MediaSearchModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.overview)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.mediaType)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonSearchModelAdapter extends TypeAdapter<PersonSearchModel> {
  @override
  final typeId = 1;

  @override
  PersonSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonSearchModel(
      department: fields[0] as String?,
      knownFor: (fields[1] as List).cast<SearchModel>(),
      id: (fields[2] as num).toInt(),
      mediaType: fields[3] as String,
      name: fields[4] as String,
      originalName: fields[5] as String,
      releaseDate: fields[6] as String,
      profilePath: fields[7] == null ? '' : fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonSearchModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.department)
      ..writeByte(1)
      ..write(obj.knownFor)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.mediaType)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
