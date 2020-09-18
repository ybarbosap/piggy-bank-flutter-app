import 'package:flutter/material.dart';

const Color DARK_PRIMARY_COLOR = Color(0xff616161);
const Color LIGHT_PRIMARY_COLOR = Color(0xffF5F5F5);
const Color PRIMARY_COLOR = Color(0xff9E9E9E);
const Color TEXT_ICONS_COLOR = Color(0xff212121);
const Color ACCENT_COLOR = Colors.deepPurple; //(0xffE040FB);
const Color PRIMARY_TEXT_COLOR = Color(0xff212121);
const Color SECONDARY_TEXT_COLOR = Color(0xff757575);
const Color DIVIDER_COLOR = Color(0xffBDBDBD);

ThemeData createAppTheme() => ThemeData(
    primaryColorDark: DARK_PRIMARY_COLOR,
    primaryColorLight: LIGHT_PRIMARY_COLOR,
    primaryColor: PRIMARY_COLOR,
    accentColor: ACCENT_COLOR,
    dividerColor: DIVIDER_COLOR,
    textTheme: TextTheme(
        headline1: TextStyle(color: PRIMARY_TEXT_COLOR),
        headline2: TextStyle(color: SECONDARY_TEXT_COLOR),
        // Texto de ícones
        headline3: TextStyle(color: TEXT_ICONS_COLOR)));
