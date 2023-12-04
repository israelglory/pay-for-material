import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_for_material/core/cores.dart';
import 'package:pay_for_material/data/datasources/local/base/local_storage_service.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';

Future<void> main() async {
  setupLocator();
  await LocalStorageService.init();
  await AppGlobals.instance.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(38, 27, 177, 115), // status bar color
    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light,
  ));

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
