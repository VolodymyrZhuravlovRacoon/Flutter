import 'package:flutter/material.dart';
import 'package:fluttertestapp/localization/application.dart';
import 'package:fluttertestapp/screens/start_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertestapp/utils/constants.dart';
import 'package:fluttertestapp/utils/dimens.dart';

import 'localization/app_translations_delegate.dart';

main(){
  runApp( Constants(
      child: AppColor(
          child: AppDimens(
              child: LocalisedApp())
      )
  )
  );
}

class LocalisedApp extends StatefulWidget {
  @override
  LocalisedAppState createState() {
    return new LocalisedAppState();
  }
}

class LocalisedAppState extends State<LocalisedApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      localizationsDelegates: [
        _newLocaleDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("uk", ""),
        const Locale("ru", ""),
      ],
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
