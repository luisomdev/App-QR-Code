//Here the theme and functions about theme.
import 'package:app/features/database/ops.standart.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool verifyTheme(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    var readTheme = read("configuration", "theme");
    if (readTheme.containsKey('theme')) {
      print("Create data");
      create("configuration", "theme", {"theme": "light"});
      return false;
    }
    create("configuration", "theme", {"theme": "dark"});
    return true;
  } else {
    create("configuration", "theme", {"theme": "light"});
    return false;
  }
}

ThemeMode switchTheme(BuildContext context) {
  if (verifyTheme(context)) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
}

abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.sepia,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      adaptiveInputDecoratorRadius: FlexAdaptive.all(),
      defaultRadius: 5.0,
      filledButtonRadius: 40.0,
      elevatedButtonRadius: 40.0,
      inputDecoratorIsDense: true,
      inputDecoratorContentPadding:
          EdgeInsetsDirectional.fromSTEB(32, 16, 32, 10),
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 40.0,
      inputDecoratorRadiusAdaptive: 40.0,
      inputDecoratorUnfocusedBorderIsColored: true,
      inputDecoratorFocusedBorderWidth: 2.0,
      fabUseShape: true,
      fabRadius: 60.0,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.sepia,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      adaptiveInputDecoratorRadius: FlexAdaptive.all(),
      defaultRadius: 5.0,
      filledButtonRadius: 40.0,
      elevatedButtonRadius: 40.0,
      inputDecoratorSchemeColor: SchemeColor.primary,
      inputDecoratorIsDense: true,
      inputDecoratorContentPadding:
          EdgeInsetsDirectional.fromSTEB(32, 16, 32, 10),
      inputDecoratorBorderSchemeColor: SchemeColor.onPrimaryContainer,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 40.0,
      inputDecoratorRadiusAdaptive: 40.0,
      inputDecoratorUnfocusedBorderIsColored: true,
      inputDecoratorFocusedBorderWidth: 2.0,
      inputCursorSchemeColor: SchemeColor.primary,
      fabUseShape: true,
      fabRadius: 60.0,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
