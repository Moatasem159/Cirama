class Credits {
  final List<CastMember> cast;
  final List<CastMember> crew;

  const Credits({
    this.cast = const [],
    this.crew = const [],
  });
}

class CastMember {
  final int id;
  final int gender;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  const CastMember({
    required this.id,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    this.department,
    this.job,
  });
}