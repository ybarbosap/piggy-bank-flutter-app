import 'package:cofrinho_app/src/shared/services/db/db_service_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/remove_cubit.dart';
import 'remove_page.dart';

class RemoveModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => RemoveCubit(i.get()), singleton: false)];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => RemovePage(),
        )
      ];
}
