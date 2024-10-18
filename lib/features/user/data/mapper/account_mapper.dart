import 'package:movies_app/features/user/data/models/account_data_model.dart';
import 'package:movies_app/features/user/domain/entities/account_data.dart';
abstract class AccountMapper {
  static AccountData fromModel(AccountDataModel model) {
    return AccountData(
      avatar: model.avatar,
      id: model.id,
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      username: model.username,
    );
  }
  static AccountDataModel toModel(AccountData data) {
    return AccountDataModel(
      avatar: data.avatar,
      id: data.id,
      iso6391: data.iso6391,
      iso31661: data.iso31661,
      name: data.name,
      username: data.username,
    );
  }
}