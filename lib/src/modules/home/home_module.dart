import 'package:cofrinho_app/src/modules/bank/bank_module.dart';
import 'package:cofrinho_app/src/modules/home/cubits/cubit/home_controller_cubit.dart';
import 'package:cofrinho_app/src/modules/home/home_page.dart';
import 'package:cofrinho_app/src/modules/home/sub_modules/add/add_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sub_modules/remove/remove_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [(Bind((i) => HomeControllerCubit(i.get()), singleton: false))];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter("/add", module: AddModule()),
        ModularRouter("/remove", module: RemoveModule()),
      ];
}
