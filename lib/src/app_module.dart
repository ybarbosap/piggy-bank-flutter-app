import 'package:cofrinho_app/generated/l10n.dart';
import 'package:cofrinho_app/src/app_widget.dart';
import 'package:cofrinho_app/src/modules/splash/splash_module.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_imp2.dart';
import 'package:cofrinho_app/src/shared/services/native_android_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/bank/bank_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DbService(), singleton: false),
        Bind((i) => NativeAndroidService()),
        Bind((i) => S())
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter("/bank", module: BankModule()),
        ModularRouter("/home", module: HomeModule()),
      ];
}
