import 'package:ch_2/provider/datetimeprovider.dart';
import 'package:ch_2/provider/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'android_screen/home.dart';
import 'ios_screen/home_1.dart';
import 'provider/platformprovider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ListenableProvider(create: (context) => platformprovider()),
        ListenableProvider(create: (context) => profileprovider()),
        ListenableProvider(create: (context) => themeprovider()),
        ListenableProvider(create: (context) => datetimeprovider()),
        ListenableProvider(create: (context) => Contactprovider()),
        ListenableProvider(create: (context) => themeprovider()),
        ListenableProvider(create: (context) => profileprovider2()),
      ],
      builder: (context, _) =>
          (Provider.of<platformprovider>(context, listen: true).Plat.isios ==
                  false)
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: home(),
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: (Provider.of<themeprovider>(context, listen: true)
                              .theme3
                              .isdark ==
                          false)
                      ? ThemeMode.dark
                      : ThemeMode.light,
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  home: home1(),
                )));
}
