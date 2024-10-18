class AccountData {
  final String avatar;
  final int id;
  final String iso6391;
  final String iso31661;
  final String name;
  final String username;
  const AccountData({
    required this.avatar,
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.username,
  });
  static const AccountData empty = AccountData(
    avatar: '',
    id: 0,
    iso6391: '',
    iso31661: '',
    name: 'sndbfwysdjklj hhj kdjwhsfj',
    username: 'skfhgyh jsfjsjfbhjkm  jhjn',
  );
}