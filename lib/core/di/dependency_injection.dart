import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/bloc_observer.dart';
import 'package:movies_app/core/api/dio_factory.dart';
import 'package:movies_app/core/api/network_info.dart';
import 'package:movies_app/core/storage/shared_preferences_factory.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/media/data/repository/media_repository_imp.dart';
import 'package:movies_app/features/media/data/sources/media_remote_data_source.dart';
import 'package:movies_app/features/media/domain/repository/media_repository.dart';
import 'package:movies_app/features/media/domain/usecase/get_media_list_usecase.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';
import 'package:movies_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:movies_app/features/search/data/sources/search_local_data_source.dart';
import 'package:movies_app/features/search/data/sources/search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/repositories/search_repository.dart';
import 'package:movies_app/features/user/data/repositories/account_repository_impl.dart';
import 'package:movies_app/features/user/data/repositories/auth_repository_impl.dart';
import 'package:movies_app/features/user/data/sources/account_data_source.dart';
import 'package:movies_app/features/user/data/sources/auth_data_source.dart';
import 'package:movies_app/features/user/data/sources/auth_local_data_source.dart';
import 'package:movies_app/features/user/domain/repositories/account_repository.dart';
import 'package:movies_app/features/user/domain/repositories/auth_repository.dart';
import 'package:movies_app/features/user/domain/usecases/get_session_id_usecase.dart';
import 'package:path_provider/path_provider.dart';

Future<void> setUpGetIt() async {
  await _setUpExtra();
  await _setUpHive();
  await _setUpAuth();
  await _setUpSearch();
  _setUpMedia();
  _setUpAccount();
}

_setUpHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieSearchModelAdapter());
  Hive.registerAdapter(TvSearchModelAdapter());
  Hive.registerAdapter(PersonSearchModelAdapter());
}

_setUpMedia() {
  GetIt.I.registerLazySingleton<MediaRemoteDataSource>(
    () => MediaRemoteDataSource(
      GetIt.I.get<Dio>(),
    ),
  );
  GetIt.I.registerLazySingleton<MediaRepository>(
    () => MediaRepositoryImpl(
      GetIt.I.get<NetworkInfo>(),
      GetIt.I.get<MediaRemoteDataSource>(),
    ),
  );
  GetIt.I.registerLazySingleton<GetMediaListUseCase>(
    () => GetMediaListUseCase(
      GetIt.I.get<MediaRepository>(),
    ),
  );
}

_setUpExtra() async {
  GetIt.I.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(
      checkInterval: const Duration(milliseconds: 3500),
    ),
  );
  GetIt.I.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      GetIt.I.get<InternetConnectionChecker>(),
    ),
  );
  Dio dio = DioFactory.getDio();
  GetIt.I.registerLazySingleton<Dio>(
    () => dio,
  );
  GetIt.I.registerLazySingleton<SharedPreferencesFactory>(
    () => SharedPreferencesFactory(),
  );
  await _setupBloc();
}

Future<void> _setupBloc() async {
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
}

_setUpAuth() async {
  GetIt.I.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(
      GetIt.I.get<Dio>(),
    ),
  );
  GetIt.I.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      GetIt.I<SharedPreferencesFactory>(),
    ),
  );
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      GetIt.I.get<NetworkInfo>(),
      GetIt.I.get<AuthDataSource>(),
      GetIt.I.get<AuthLocalDataSource>(),
    ),
  );
  await _getSessionId();
}

_setUpAccount() {
  GetIt.I.registerLazySingleton<AccountDataSource>(
    () => AccountDataSource(
      GetIt.I.get<Dio>(),
    ),
  );
  GetIt.I.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      GetIt.I.get<NetworkInfo>(),
      GetIt.I.get<AccountDataSource>(),
    ),
  );
}

_getSessionId() async {
  AppConstants.sessionId = await GetSessionIdUsecase(GetIt.I.get<AuthRepository>()).call();
}

_setUpSearch() async {
  GetIt.I.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSource(
      GetIt.I.get<Dio>(),
    ),
  );
  final Box<SearchModel> searchBox = await Hive.openBox<SearchModel>("searchBox");
  GetIt.I.registerLazySingleton<Box<SearchModel>>(() => searchBox);
  GetIt.I.registerLazySingleton<SearchLocalDataSource>(
    () => SearchLocalDataSource(GetIt.I.get<Box<SearchModel>>()),
  );
  GetIt.I.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      GetIt.I.get<NetworkInfo>(),
      GetIt.I.get<SearchRemoteDataSource>(),
      GetIt.I.get<SearchLocalDataSource>(),
    ),
  );
}