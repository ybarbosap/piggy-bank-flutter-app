import 'package:cofrinho_app/generated/l10n.dart';
import 'package:cofrinho_app/src/modules/bank/sub_modules/add/cubit/add_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_page.dart';

class AddOModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => AddCubit(i.get()), singleton: false)];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AddOPage(args.data))
      ];
}
