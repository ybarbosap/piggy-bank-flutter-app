import 'package:cofrinho_app/generated/l10n.dart';
import 'package:cofrinho_app/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Safe Area app",
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
      theme: createAppTheme(),
    );
  }
}
