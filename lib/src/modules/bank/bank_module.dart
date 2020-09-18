import 'package:cofrinho_app/src/modules/bank/cubit/drop_menu/drop_menu_cubit.dart';
import 'package:cofrinho_app/src/shared/services/db/db_service_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bank_page.dart';
import 'cubit/bank/bank_cubit.dart';
import 'cubit/operations/operation_cubit.dart';
import 'sub_modules/add/add_module.dart';

class BankModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BankCubit(i.get()), singleton: false),
        Bind((i) => OperationCubit(i.get()), singleton: false),
        Bind((i) => DropMenuCubit(), singleton: false),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (context, args) => BankPage(args.data)),
        ModularRouter("/add", module: AddOModule())
      ];
}
