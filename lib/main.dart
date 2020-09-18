import 'package:admob_flutter/admob_flutter.dart';
import 'package:cofrinho_app/src/app_module.dart';
import 'package:cofrinho_app/src/utils/admob_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(AdmobId.appID);
  runApp(ModularApp(module: AppModule()));
}
