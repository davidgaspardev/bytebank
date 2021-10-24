import 'package:flutter/material.dart';

class ThemeColors {
  static const color50 = Color(0xFF404040);
  static const color100 = Color(0xFF3D3D3D);
  static const color200 = Color(0xFF393939);
  static const color300 = Color(0xFF353535);
  static const color400 = Color(0xFF313131);
  static const color500 = Color(0xFF2D2D2D);
  static const color600 = Color(0xFF292929);
  static const color700 = Color(0xFF252525);
  static const color800 = Color(0xFF212121);
  static const color900 = Color(0xFF1D1D1D);

  static const theme = <int, Color>{
    50: color50,
    100: color100,
    200: color200,
    300: color300,
    400: color400,
    500: color500,
    600: color600,
    700: color700,
    800: color800,
    900: color900,
  };

  static get primarySwatch => MaterialColor(color500.value, theme);
}
