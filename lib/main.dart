import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/utility/AppConfigProvider.dart';
import 'package:quran_application/tabs/Quran/QuranScreen.dart';
import 'package:quran_application/tabs/Radio/RadioSceen.dart';
import 'package:quran_application/tabs/Tasbeeh/TasbeehScreen.dart';
import 'package:quran_application/tabs/Hadeth/HadethScreen.dart';
import 'utility/ThemeData.dart';
import 'package:quran_application/tabs/Splash/SplashCustom.dart';
import 'Home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utility/Preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (buildContext) => AppConfigProvider(),
      builder: (buildContext,widget){

      final provider = Provider.of<AppConfigProvider>(buildContext);
      provider.themeMode = Preferences.getThemePreference();

        return MaterialApp(
          themeMode: provider.themeMode,
          darkTheme: OptionalThemeData.darkTheme,
          theme: OptionalThemeData.lightTheme,
          localizationsDelegates:[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale.fromSubtags(languageCode: Preferences.getLanguage()),
          title: "Quran",
          debugShowCheckedModeBanner: false,
          home: SplashCustom(),
          routes: {
            Home.routeName:(context)=>Home(),
            QuranScreen.routeName:(context)=>QuranScreen(),
            SplashCustom.routeName: (context)=>SplashCustom(),
            TasbeehScreen.routeName: (context)=>TasbeehScreen(),
            HadethScreen.routeName:(context)=>HadethScreen(),
            RadioScreen.routeName:(context)=>RadioScreen(),
          },
        );
      },
    );
  }
}