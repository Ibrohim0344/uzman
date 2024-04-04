import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'data/storage/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalStorage.init();
  runApp(const App());
}
