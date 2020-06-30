import 'package:flutter/material.dart';

class AppColor extends InheritedWidget {
  static AppColor of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<AppColor>();

  const AppColor({Widget child, Key key}): super(key: key, child: child);

  final Color main_bg = const Color(0xFFFAFAFA);
  final Color text_grey = const Color(0xFF9A9DA3);
  final Color field_grey = const Color(0xFFF4F4F4);
  final Color field_beige = const Color(0xFFFFFBF1);
  final Color btn_blue = const Color(0xff0496FF);
  final Color white_text = const Color(0xFFFFFFFF);
  final Color black_text = const Color(0xFF000000);
  final Color white_field_bg = const Color(0xFFFFFFFF);
  final Color circle_chart_grey = const Color(0xFFEEEEEE);
  final Color circle_chart_yellow = const Color(0xFFFFBD13);
  final Color green_color = Colors.green;
  final Color red = Colors.red;

  @override
  bool updateShouldNotify(AppColor oldWidget) => false;
}

class AppDimens extends InheritedWidget {
  static AppDimens of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<AppDimens>();

  const AppDimens({Widget child, Key key}): super(key: key, child: child);

  final double back_btn_height = 20.0;
  final double main_margin = 30.0;
  final double main_margin_big = 60.0;
  final double main_margin_small = 10.0;
  final double btn_padding = 21.0;
  final double icon_padding = 6.0;
  final double corner_radius = 10.0;
  final double H02 = 44;
  final double H01 = 32;
  final double H0_5 = 28;
  final double H0 = 26;
  final double H1 = 22;
  final double H1_5 = 18;
  final double H2 = 16;
  final double H3 = 14;
  final double H4 = 12;
  final double H5 = 10;

  @override
  bool updateShouldNotify(AppDimens oldWidget) => false;
}