import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/bloc_observer.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';
import 'package:movies_app/features/user/domain/repositories/auth_repository.dart';
import 'package:movies_app/features/user/domain/usecases/get_session_id_usecase.dart';
import 'package:path_provider/path_provider.dart';

import 'dependency_injection.config.dart';
@InjectableInit(initializerName: 'init', preferRelativeImports: true)
Future<void> configureDependencies() async => GetIt.I.init();
Future<void> setupConfiguration() async {
  await configureDependencies();
  await _setupBloc();
  await _setUpHive();
  await _getSessionId();
}
Future<void> _setUpHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MediaSearchModelAdapter());
  Hive.registerAdapter(PersonSearchModelAdapter());
  await Hive.openBox<SearchModel>("searchBox");
}
Future<void> _setupBloc() async {
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory:HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path));
}
Future<void> _getSessionId() async {
  AppConstants.sessionId = await GetSessionIdUsecase(GetIt.I.get<AuthRepository>()).call();
}