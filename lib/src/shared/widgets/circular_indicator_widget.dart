import 'package:cofrinho_app/src/utils/size_utils.dart';
import 'package:cofrinho_app/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator();
  @override
  Widget build(BuildContext context) {
    final boxSize = getWidth(context) * .05;
    return Center(
      child: Container(
        width: boxSize,
        height: boxSize,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ACCENT_COLOR),
        ),
      ),
    );
  }
}
