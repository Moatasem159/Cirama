// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:movies_app/core/storage/hive/hive_adapters/hive_adapters.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(MediaSearchModelAdapter());
    registerAdapter(PersonSearchModelAdapter());
  }
}
