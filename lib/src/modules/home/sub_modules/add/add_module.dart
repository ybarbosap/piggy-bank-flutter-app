import 'package:cofrinho_app/src/modules/home/sub_modules/add/cubit/cubit/add_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_page.dart';

class AddModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => AddCubit(i.get()), singleton: false)];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (context, args) => AddPage())
      ];
}
