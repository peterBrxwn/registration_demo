// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFF2F3F5);
  static const darkGrey = Color(0xFF777777);
  static const black = Color(0xFF181818);
  static const green = Color(0xFF019C00);
  static const transparent = Colors.transparent;
  static const notWhite = Color(0xFFEDF0F2);
  static const notBlack = Color.fromRGBO(27, 27, 27, 1);

  static const themePrimary = Color(0xFFFFCA51);
  static const _themeRed = Color(0xFFFF0626);
  static const _themeWarn = Color(0xFFFFCA51);

  static final _schemeLight = FlexSchemeColor.from(
    primary: themePrimary,
    secondary: _themeWarn,
    error: _themeRed,
  );
  static const _appBarElevation = 0.5;
  static const _appBarOpacity = 0.0;
  static const _swapColors = false;
  static final _fontFamily = GoogleFonts.inter().fontFamily;
  static const _textTheme = TextTheme(
    headline1: TextStyle(fontSize: 57, fontWeight: FontWeight.w900),
    headline2: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
    headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
    headline4: TextStyle(fontWeight: FontWeight.w900),
    headline5: TextStyle(fontWeight: FontWeight.w900),
    headline6: TextStyle(fontWeight: FontWeight.w900),
    subtitle1: TextStyle(fontWeight: FontWeight.bold),
    subtitle2: TextStyle(fontWeight: FontWeight.bold),
    overline: TextStyle(fontSize: 11, letterSpacing: 0.5),
    bodyText1: TextStyle(fontSize: 18, color: AppTheme.notBlack),
  );
  static const _surfaceMode = FlexSurfaceMode.highBackgroundLowScaffold;
  static const _blendLevel = 15;
  static const _subThemesData = FlexSubThemesData(
    interactionEffects: true,
    defaultRadius: 12.5,
    bottomSheetRadius: 24,
    inputDecoratorBorderType: FlexInputBorderType.outline,
    inputDecoratorIsFilled: false,
    inputDecoratorUnfocusedHasBorder: true,
    elevatedButtonElevation: 1,
    thickBorderWidth: 2,
    thinBorderWidth: 1.5,
  );
  static const _transparentStatusBar = true;
  static const _tabBarForAppBar = FlexTabBarStyle.forAppBar;
  static const _tooltipsMatchBackground = true;
  static final _visualDensity = FlexColorScheme.comfortablePlatformDensity;
  static final _platform = defaultTargetPlatform;
  static final _checkBoxTheme = CheckboxThemeData(
    side: MaterialStateBorderSide.resolveWith(
      (_) => const BorderSide(width: 1, color: themePrimary),
    ),
    fillColor: MaterialStateProperty.all(themePrimary),
  );
  static const pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    },
  );

  static final themeDataLight = FlexThemeData.light(
    colors: _schemeLight,
    swapColors: _swapColors,
    lightIsWhite: true,
    appBarStyle: FlexAppBarStyle.primary,
    appBarOpacity: _appBarOpacity,
    transparentStatusBar: _transparentStatusBar,
    tabBarStyle: _tabBarForAppBar,
    surfaceMode: _surfaceMode,
    blendLevel: _blendLevel,
    tooltipsMatchBackground: _tooltipsMatchBackground,
    fontFamily: _fontFamily,
    onPrimary: black,
    onError: white,
    onSecondary: white,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: _subThemesData,
    visualDensity: _visualDensity,
    platform: _platform,
    scaffoldBackground: notWhite,
  ).copyWith(
    brightness: Brightness.light,
    checkboxTheme: _checkBoxTheme,
    useMaterial3: true,
    pageTransitionsTheme: pageTransitionsTheme,
  );

  static final themeDataDark = FlexThemeData.dark(
    colors: _schemeLight,
    swapColors: _swapColors,
    darkIsTrueBlack: true,
    appBarStyle: FlexAppBarStyle.primary,
    appBarElevation: _appBarElevation,
    appBarOpacity: _appBarOpacity,
    transparentStatusBar: _transparentStatusBar,
    tabBarStyle: _tabBarForAppBar,
    surfaceMode: _surfaceMode,
    blendLevel: _blendLevel,
    tooltipsMatchBackground: _tooltipsMatchBackground,
    fontFamily: _fontFamily,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    subThemesData: _subThemesData,
    visualDensity: _visualDensity,
    platform: _platform,
  ).copyWith(
    brightness: Brightness.dark,
    checkboxTheme: _checkBoxTheme,
    useMaterial3: true,
    pageTransitionsTheme: pageTransitionsTheme,
  );
}
