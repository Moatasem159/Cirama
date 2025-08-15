// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/media/data/sources/media_remote_data_source.dart'
    as _i368;
import '../../features/media/domain/repository/media_repository.dart' as _i989;
import '../../features/media/domain/usecase/get_media_list_usecase.dart'
    as _i79;
import '../../features/search/data/sources/search_local_data_source.dart'
    as _i259;
import '../../features/search/data/sources/search_remote_data_source.dart'
    as _i811;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i357;
import '../../features/user/data/sources/account_data_source.dart' as _i481;
import '../../features/user/data/sources/auth_data_source.dart' as _i423;
import '../../features/user/data/sources/auth_local_data_source.dart' as _i741;
import '../../features/user/domain/repositories/account_repository.dart'
    as _i117;
import '../../features/user/domain/repositories/auth_repository.dart' as _i939;
import '../api/dio_factory.dart' as _i1008;
import '../api/network_info.dart' as _i715;
import '../storage/shared_preferences_factory.dart' as _i320;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioFactory = _$DioFactory();
    gh.factory<_i361.Dio>(() => dioFactory.createInstance);
    gh.lazySingleton<_i715.NetworkInfo>(() => _i715.NetworkInfo());
    gh.lazySingleton<_i320.SharedPreferencesFactory>(
      () => _i320.SharedPreferencesFactory(),
    );
    gh.lazySingleton<_i259.SearchLocalDataSource>(
      () => const _i259.SearchLocalDataSource(),
    );
    gh.lazySingleton<_i368.MediaRemoteDataSource>(
      () => _i368.MediaRemoteDataSource.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i811.SearchRemoteDataSource>(
      () => _i811.SearchRemoteDataSource.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i481.AccountDataSource>(
      () => _i481.AccountDataSource.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i423.AuthDataSource>(
      () => _i423.AuthDataSource.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i741.AuthLocalDataSource>(
      () => _i741.AuthLocalDataSource.new(gh<_i320.SharedPreferencesFactory>()),
    );
    gh.lazySingleton<_i939.AuthRepository>(
      () => _i939.AuthRepository.new(
        gh<_i715.NetworkInfo>(),
        gh<_i423.AuthDataSource>(),
        gh<_i741.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i117.AccountRepository>(
      () => _i117.AccountRepository.new(
        gh<_i715.NetworkInfo>(),
        gh<_i481.AccountDataSource>(),
      ),
    );
    gh.lazySingleton<_i357.SearchRepository>(
      () => _i357.SearchRepository.new(
        gh<_i715.NetworkInfo>(),
        gh<_i811.SearchRemoteDataSource>(),
        gh<_i259.SearchLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i989.MediaRepository>(
      () => _i989.MediaRepository.new(
        gh<_i715.NetworkInfo>(),
        gh<_i368.MediaRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i79.GetMediaListUseCase>(
      () => _i79.GetMediaListUseCase(gh<_i989.MediaRepository>()),
    );
    return this;
  }
}

class _$DioFactory extends _i1008.DioFactory {}
