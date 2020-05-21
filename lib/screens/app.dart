import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scope_demo/controllers/Answers/AnswersProvider.dart';
import 'package:scope_demo/controllers/Authentication/authentication_provider.dart';
import 'package:scope_demo/controllers/Questions/questions_provider.dart';
import 'package:scope_demo/controllers/app_localizations.dart';
import 'package:scope_demo/controllers/services_provider.dart';
import 'package:scope_demo/controllers/userUpload/UploadUserImage.dart';
import 'package:scope_demo/screens/language.dart';
import 'package:scope_demo/tabs.dart';

class App extends StatelessWidget {
  final color = const Color(0xff6F499D);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthenticationProvider(),
        ),

        ///[ProxyProvider]  the 'UploadUserImage' widget depends on  [Auth] & [UploadUserImage]
        ChangeNotifierProxyProvider<AuthenticationProvider, UploadUserImage>(
          update: (context, auth, __) => UploadUserImage(
            auth.token,
            auth.userId,
          ),
          create: (_) => null,
        ),
        ChangeNotifierProvider.value(value: ServicesProvider()),

        ///[ProxyProvider]  the 'UploadUserImage' widget depends on  [Auth] & [UploadUserImage]
        ChangeNotifierProxyProvider<AuthenticationProvider, QuestionsProvider>(
          update: (context, auth, __) => QuestionsProvider(
            auth: auth.token,
          ),
          create: (_) => null,
        ),

        ///[ProxyProvider]  the 'UploadUserImage' widget depends on  [Auth] & [UploadUserImage]
        ChangeNotifierProxyProvider<AuthenticationProvider, AnswersProvider>(
          update: (context, auth, __) => AnswersProvider(
            auth: auth.token,
          ),
          create: (_) => null,
        ),
      ],
      child: Consumer<AuthenticationProvider>(
        builder: (ctx, auth, child) {
          return Consumer<ServicesProvider>(
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
                home: auth.isAuth
                    ? ScrollableTabsDemo()
                    : Scaffold(
                        body: FutureBuilder(
                          future: auth.tryAutoLogIn(),
                          builder: (context, authResultSnapShot) =>
                              authResultSnapShot.connectionState ==
                                      ConnectionState.waiting
                                  ? Center(child: CircularProgressIndicator())
                                  : AppLanguage(),
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
