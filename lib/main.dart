import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive/hive.dart';
import 'package:inside_trainning/app/language_change_provider.dart';
import 'package:inside_trainning/app/pages/login/login_view.dart';
import 'package:inside_trainning/app/pages/router_app.dart';
import 'package:inside_trainning/app_theme.dart';
import 'package:inside_trainning/generated/l10n.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  if (Platform.isAndroid) {
    // WebView.platform = AndroidWebView();
  }

  // FlutterCriptography.enabled();

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);

    // Hive.registerAdapter(hiveState.StateAdapter());
    // Hive.registerAdapter(HiveKitsEnlazadosAdapter());

    runApp(const MainApp());
  }, catchUnhandledExceptions);
  // (error, stack) => log('Unhandled error:', error: error, stackTrace: stack),
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  FlutterError.reportError(
    FlutterErrorDetails(
      exception: error,
      library: 'CUSTOM MESSAGE 1',
      context: ErrorSummary('CUSTOM MESSAGE 2'),
    ),
  );

  // log(stackTrace: stack, label: error.toString());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final RouterApp _router = RouterApp();

  @override
  void initState() {
    super.initState();

    initLogger();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageChangeProvider>(
          create: ((context) => LanguageChangeProvider()),
        )
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inside trainning',
          theme: AppTheme().theme(),
          localizationsDelegates: [
            S.delegate,
            FormBuilderLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: context.watch<LanguageChangeProvider>().currentLocale,
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: _router.getRoute,
          navigatorObservers: [_router.routeObserver],
          home: LoginView(),
        );
      }),
    );
  }

  void initLogger() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord record) {
      final dynamic e = record.error;
      final String m = /*e is Exception ? e.message : */ e.toString();

      // ignore: avoid_print
      print('${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });

    Logger.root.info('Logger initialized.');
  }
}
