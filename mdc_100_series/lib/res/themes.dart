import 'package:flutter/material.dart';

import 'colors.dart';
import '../supplemental/cut_corners_border.dart';

// TODO: Build a Shrine Theme (103)
ThemeData shrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonColor: kShrinePink100,
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(base.textTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      primaryIconTheme: _buildShrineIconTheme(base.iconTheme),
      inputDecorationTheme: _buildShrineInputDecorationTheme());
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

IconThemeData _buildShrineIconTheme(IconThemeData base) {
  return base.copyWith(color: kShrineBrown900);
}

InputDecorationTheme _buildShrineInputDecorationTheme() {
  return InputDecorationTheme(border: CutCornersBorder());
}

