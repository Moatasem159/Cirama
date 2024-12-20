import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/user/data/models/account_data_model.dart';
import 'package:retrofit/retrofit.dart';

part 'account_data_source.g.dart';
@lazySingleton
@RestApi()
abstract class AccountDataSource {
  @factoryMethod
  factory AccountDataSource(Dio dio) = _AccountDataSource;
  @GET("getAccountData")
  Future<AccountDataModel> getAccount();
}