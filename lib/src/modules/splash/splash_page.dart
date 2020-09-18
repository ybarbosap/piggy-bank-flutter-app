import 'package:cofrinho_app/src/shared/widgets/circular_indicator_widget.dart';
import 'package:cofrinho_app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    SharedPreferences.getInstance().then((prefs) {
      var favorit = prefs.getInt("id");
      if (favorit != null) {
        Modular.to
            .pushNamedAndRemoveUntil("/bank", (_) => false, arguments: favorit);
      } else {
        Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        child: CircularIndicator(),
      ),
    );
  }
}
