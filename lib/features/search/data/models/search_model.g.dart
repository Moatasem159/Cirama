// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieSearchModelAdapter extends TypeAdapter<MovieSearchModel> {
  @override
  final int typeId = 0;

  @override
  MovieSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieSearchModel(
      overview: fields[6] as String,
      backdropPath: fields[7] == null ? '' : fields[7] as String,
      id: fields[0] as int,
      mediaType: fields[1] as String,
      name: fields[2] as String,
      originalName: fields[3] as String,
      releaseDate: fields[4] as String,
      profilePath: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieSearchModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.backdropPath)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mediaType)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originalName)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TvSearchModelAdapter extends TypeAdapter<TvSearchModel> {
  @override
  final int typeId = 1;

  @override
  TvSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSearchModel(
      overview: fields[6] as String,
      backdropPath: fields[7] == null ? '' : fields[7] as String,
      id: fields[0] as int,
      mediaType: fields[1] as String,
      name: fields[2] as String,
      originalName: fields[3] as String,
      releaseDate: fields[4] as String,
      profilePath: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TvSearchModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.backdropPath)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mediaType)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originalName)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonSearchModelAdapter extends TypeAdapter<PersonSearchModel> {
  @override
  final int typeId = 2;

  @override
  PersonSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonSearchModel(
      department: fields[6] as String?,
      knownFor: (fields[7] as List).cast<SearchModel>(),
      id: fields[0] as int,
      mediaType: fields[1] as String,
      name: fields[2] as String,
      originalName: fields[3] as String,
      releaseDate: fields[4] as String,
      profilePath: fields[5] == null ? '' : fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonSearchModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(6)
      ..write(obj.department)
      ..writeByte(7)
      ..write(obj.knownFor)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mediaType)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originalName)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSearchModel _$MovieSearchModelFromJson(Map<String, dynamic> json) =>
    MovieSearchModel(
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String? ?? '',
      id: (json['id'] as num).toInt(),
      mediaType: json['media_type'] as String,
      name: readName(json, 'name') as String,
      originalName: readOriginalName(json, 'originalName') as String,
      releaseDate: readReleaseDate(json, 'releaseDate') as String,
      profilePath: readProfilePath(json, 'profilePath') as String? ?? '',
    );

TvSearchModel _$TvSearchModelFromJson(Map<String, dynamic> json) =>
    TvSearchModel(
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String? ?? '',
      id: (json['id'] as num).toInt(),
      mediaType: json['media_type'] as String,
      name: readName(json, 'name') as String,
      originalName: readOriginalName(json, 'originalName') as String,
      releaseDate: readReleaseDate(json, 'releaseDate') as String,
      profilePath: readProfilePath(json, 'profilePath') as String? ?? '',
    );

PersonSearchModel _$PersonSearchModelFromJson(Map<String, dynamic> json) =>
    PersonSearchModel(
      department: json['known_for_department'] as String?,
      knownFor: (json['known_for'] as List<dynamic>)
          .map((e) =>
              const SearchModelConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
      mediaType: json['media_type'] as String,
      name: readName(json, 'name') as String,
      originalName: readOriginalName(json, 'originalName') as String,
      releaseDate: readReleaseDate(json, 'releaseDate') as String,
      profilePath: readProfilePath(json, 'profilePath') as String? ?? '',
    );
