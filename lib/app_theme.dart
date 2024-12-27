import 'package:flutter/material.dart';
import 'package:inside_trainning/app_colors.dart';

class AppTheme {
  static const double paddingV = 10.0;
  static const double paddingH = 20.0;

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.lightColorScheme,
      // primarySwatch: AppColors.primaryMaterialColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Avenir',
      primaryColor: AppColors.lightColorScheme.primary,
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.lightColorScheme.inverseSurface,
        backgroundColor: AppColors.lightColorScheme.primary,
        elevation: 0.0,
        centerTitle: true,
      ),
      iconTheme: IconThemeData(color: AppColors.lightColorScheme.secondary),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 32.0, fontWeight: FontWeight.bold), // headline1
        displayMedium: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 28.0, fontWeight: FontWeight.bold), // headline2
        displaySmall: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 24.0, fontWeight: FontWeight.bold), // headline3
        headlineLarge: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 20.0, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 18.0, fontWeight: FontWeight.bold), // headline4
        headlineSmall: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 14.0, fontWeight: FontWeight.bold), // headline5
        titleLarge: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 20.0, fontWeight: FontWeight.normal), // headline6
        titleMedium: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 18.0, fontWeight: FontWeight.normal), // subtitle1
        titleSmall: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 16.0, fontWeight: FontWeight.normal), // subtitle2
        bodyLarge: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 18.0, fontWeight: FontWeight.normal), // bodyText1
        bodyMedium: TextStyle(color: AppColors.lightColorScheme.primary, fontSize: 16.0, fontWeight: FontWeight.normal), // bodyText2
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(12.0),
        // isDense seems to do nothing if you pass padding in
        isDense: true,
        // "always" put the label at the top
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // This can be useful for putting TextFields in a row
        // However, if might be more desirable to wrap with Flexible
        // to make then grow to the available width.
        constraints: const BoxConstraints(maxWidth: 350.0),

        // Borders
        // Enabled and not showing error
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 1.0,
          ),
        ),
        // Have error but not focus
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        // Has error and focus
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        // Default value if borders are null
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            color: AppColors.lightColorScheme.surface,
            width: 1.0,
          ),
        ),
        // Enabled and focus
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: AppColors.lightColorScheme.secondary,
            width: 1.0,
          ),
        ),
        // Disabled
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 1.0,
          ),
        ),

        // TextStyles
        suffixStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        counterStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        // Make error and helper the same size, so that the field
        // does not grow in height when there is an error text
        helperMaxLines: 2,
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        helperStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        hintStyle: TextStyle(
          color: AppColors.lightColorScheme.outline,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
          color: AppColors.lightColorScheme.secondaryContainer,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStateProperty.resolveWith<BorderSide>((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: AppColors.lightColorScheme.outline,
                width: 1.0,
              );
            }
            return BorderSide(
              color: AppColors.lightColorScheme.primary,
              width: 1.0,
            );
          }),
          elevation: WidgetStateProperty.resolveWith((states) => 2.0),
          padding: WidgetStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.lightColorScheme.onSurfaceVariant;
            }
            return AppColors.lightColorScheme.primary;
          }),
          shape: WidgetStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
      ),
    );
  }
}
