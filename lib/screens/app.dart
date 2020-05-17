import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Authentication/authentication_provider.dart';
import 'package:scope_demo/controllers/Questions/questions_provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/controllers/services_provider.dart';
import 'package:scope_demo/screens/language.dart';

class App extends StatelessWidget {
  final color = const Color(0xff6F499D);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ServicesProvider()),
        ChangeNotifierProvider.value(value: QuestionsProvider()),
        ChangeNotifierProvider.value(value: AuthenticationProvider()),
      ],
      child: Consumer<ServicesProvider>(
        builder: (ctx, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            theme: new ThemeData(
              fontFamily: 'light',
              textTheme: TextTheme(title: TextStyle(fontSize: 1)),
              primaryColor: color,
            ),
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', 'AR'),
              Locale('es', 'ES'),
              Locale('hi', 'IN'),
              Locale('ml', 'IN'),
              Locale('zh', 'CN'),
            ],
            locale: model.appLocal,
            home: AppLanguage(),
          );
        },
      ),
    );
  }
}
