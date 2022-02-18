import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor dark = MaterialColor(
    0xfffa6800, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which does not require a swatch.
    <int, Color>{
      50:  Color(0xffe15e00),//10%
      100: Color(0xffc85300),//20%
      200: Color(0xffaf4900),//30%
      300: Color(0xff963e00),//40%
      400: Color(0xff7d3400),//50%
      500: Color(0xff642a00),//60%
      600: Color(0xff4b1f00),//70%
      700: Color(0xff321500),//80%
      800: Color(0xff190a00),//90%
      900: Color(0xff000000),//100%
    },
  );

  static const MaterialColor light = MaterialColor(
    0xff253b5f, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which does not require a swatch.
    <int, Color>{
      50:  Color(0xff3b4f6f),//10%
      100: Color(0xff51627f),//20%
      200: Color(0xff66768f),//30%
      300: Color(0xff7c899f),//40%
      400: Color(0xff929daf),//50%
      500: Color(0xffa8b1bf),//60%
      600: Color(0xffbec4cf),//70%
      700: Color(0xffd3d8df),//80%
      800: Color(0xffe9ebef),//90%
      900: Color(0xffffffff),//100%
    },
  );
}