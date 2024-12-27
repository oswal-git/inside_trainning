import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF633EFF),
    onPrimary: Color(0XFFFFFFFF),
    primaryContainer: Color(0xFF58EE4A),
    onPrimaryContainer: Color(0xFF58EE4A),
    secondary: Color(0xFF00C8C8),
    onSecondary: Color(0xFF322942),
    secondaryContainer: Color(0xFFFF2E80),
    onSecondaryContainer: Color(0xFF58EE4A),
    tertiary: Color(0xFF58EE4A),
    onTertiary: Color(0xFF58EE4A),
    tertiaryContainer: Color(0xFF58EE4A),
    onTertiaryContainer: Color(0xFFFFE801),
    error: Colors.redAccent,
    errorContainer: Color(0xFF262938),
    onError: Colors.red.shade400,
    onErrorContainer: Color(0xFF58EE4A),
    // ignore: deprecated_member_use
    background: Color(0xFF636363), // background
    // ignore: deprecated_member_use
    onBackground: Color(0xFFFFFFFF), // background
    surface: Color(0xFF808080), // background
    onSurface: Color(0xFF241E30),
    surfaceContainerHighest: Color(0xFF58EE4A),
    onSurfaceVariant: Color(0xFFB8BDB7),
    outline: Color(0x19222222),
    inverseSurface: Color(0xFFFFFFFF),
    onInverseSurface: Color(0xFF58EE4A),
    shadow: Color(0xFF58EE4A),
    surfaceTint: Color(0xFF58EE4A),
    outlineVariant: Color(0xFF58EE4A),
    scrim: Color(0xFF58EE4A),
  );
}
